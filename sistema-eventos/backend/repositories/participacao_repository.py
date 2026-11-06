"""
Repository: Participacao (inscrição em palestra).

CAMADA: Repositories (consultas com SQL explícito).

Reúne as consultas dos casos de uso "Inscrever-se" e "Cancelar Inscrição",
que não são um CRUD simples:

1. `buscar_palestra_com_bloqueio`: busca a palestra e bloqueia a linha dela
   (`FOR UPDATE`) para controlar as vagas com segurança.
2. `buscar_inscricao`: procura a inscrição de um usuário em uma palestra.
3. `buscar_palestra_no_mesmo_horario`: filtro com JOIN que encontra o
   choque de horário (F16).

Retorno: diferente dos outros Repositories, que devolvem linhas parecidas
com dict, estes métodos devolvem objetos da Model, porque os Services
alteram esses objetos (`palestra.vagas_disponiveis -= 1`) e o Controller
usa o `to_dict()` deles. Para isso, o SQL explícito passa pelo
`from_statement`, que executa o `text` e monta o objeto da Model com o
resultado.

O Repository só consulta e nunca encerra a transação: se ele fizesse
isso, o bloqueio da palestra seria liberado antes de o caso de uso
terminar. O `commit` e o `rollback` ficam no Service. Nas saídas de erro
sem `rollback`, o bloqueio acaba junto com a requisição.
"""

from sqlalchemy import text

from backend.models.palestra import Palestra
from backend.models.participacao import Participacao


class ParticipacaoRepository:
    """Consultas SQL explícitas usadas na inscrição em palestras."""

    @staticmethod
    def buscar_palestra_com_bloqueio(id_palestra):
        """Busca a palestra e bloqueia a linha dela até o fim da transação.

        Com o `FOR UPDATE`, quem tentar ler essa mesma linha para alterá-la
        espera o fim desta transação. É isso que impede que duas inscrições
        simultâneas consumam a mesma última vaga.

        O `populate_existing` faz o objeto receber os valores lidos agora.
        Sem ele, se a palestra já tivesse sido carregada nesta requisição
        (como no `RemoverInscricaoService`), a sessão devolveria o objeto
        com as vagas antigas, mesmo com a linha bloqueada.
        """
        sql = text("SELECT * FROM palestra WHERE id_palestra = :id_palestra FOR UPDATE")
        return (
            Palestra.query.from_statement(sql)
            .params(id_palestra=id_palestra)
            .populate_existing()
            .first()
        )

    @staticmethod
    def buscar_inscricao(id_usuario, id_palestra):
        """Devolve a inscrição do usuário na palestra, ou None.

        Na inscrição, serve para impedir a duplicidade; no cancelamento,
        para achar o registro que será removido.
        """
        sql = text(
            """
            SELECT *
            FROM participacao
            WHERE id_usuario = :id_usuario AND id_palestra = :id_palestra
            """
        )
        return (
            Participacao.query.from_statement(sql)
            .params(id_usuario=id_usuario, id_palestra=id_palestra)
            .first()
        )

    @staticmethod
    def buscar_palestra_no_mesmo_horario(id_usuario, palestra):
        """Devolve uma palestra em que a pessoa já está inscrita e que bate
        no horário com `palestra`, ou None.

        Duas palestras batem quando uma começa antes de a outra terminar e
        termina depois de a outra começar. Palestra sem horário não entra
        na conta: no SQL, comparar com NULL nunca dá verdadeiro.
        """
        sql = text(
            """
            SELECT p.*
            FROM palestra p
            JOIN participacao pa ON pa.id_palestra = p.id_palestra
            WHERE pa.id_usuario = :id_usuario
              AND p.id_palestra != :id_palestra
              AND p.horario_inicio < :horario_fim
              AND p.horario_fim > :horario_inicio
            ORDER BY p.horario_inicio
            LIMIT 1
            """
        )
        return (
            Palestra.query.from_statement(sql)
            .params(
                id_usuario=id_usuario,
                id_palestra=palestra.id_palestra,
                horario_inicio=palestra.horario_inicio,
                horario_fim=palestra.horario_fim,
            )
            .first()
        )
