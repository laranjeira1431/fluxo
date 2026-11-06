"""
Caso de uso: inscrever um usuário em uma palestra.

CAMADA: Services (regra de negócio do caso de uso "Inscrever-se").

Regras preservadas da versão anterior do projeto:
- o usuário precisa existir;
- a palestra precisa existir e ter vaga disponível;
- o mesmo usuário não pode se inscrever duas vezes na mesma palestra;
- a linha da palestra é bloqueada (`FOR UPDATE`) durante a operação,
  para que duas inscrições simultâneas não consumam a mesma última vaga.

Regra da F16 (S02), palestra já iniciada: depois que a palestra começa
(`horario_inicio <= agora`, o mesmo critério da avaliação, F07), as
inscrições ficam encerradas, inclusive para a palestra já terminada.

Regra da F16 (S01), choque de horário: se a pessoa já tem inscrição em
outra palestra no mesmo horário, a inscrição NÃO é bloqueada, mas o
Service avisa (levantando `ChoqueDeHorario`) e só inscreve quando o app
manda `confirmar_choque = True`, depois que a pessoa confirmou no aviso.
Duas palestras "batem" quando uma começa antes de a outra terminar e
termina depois de a outra começar.

Este caso de uso mexe em DUAS entidades ao mesmo tempo (cria a
Participacao e decrementa `vagas_disponiveis` da Palestra), por isso a
regra fica no Service, e não em nenhuma das duas Models isoladamente.

As consultas ficam no `ParticipacaoRepository` (P19). O Service decide o
que fazer com o resultado, e o `commit` e o `rollback` ficam aqui.

Método principal:
    execute(id_usuario, id_palestra, confirmar_choque=False): cria e
    retorna a Participacao.
"""

from datetime import datetime

from backend.extensions import db
from backend.models.participacao import Participacao
from backend.models.usuario import Usuario
from backend.repositories.participacao_repository import ParticipacaoRepository


class ChoqueDeHorario(Exception):
    """A pessoa já tem inscrição em uma palestra no mesmo horário (F16).

    Não é um erro de verdade: o Controller transforma em uma resposta 409
    com os dados da palestra que bate no horário, e o app pergunta se a
    pessoa quer se inscrever mesmo assim.
    """

    def __init__(self, palestra_conflitante):
        super().__init__(
            "Você já tem inscrição em uma palestra nesse horário. "
            "Deseja mesmo se inscrever nesta?"
        )
        self.palestra_conflitante = palestra_conflitante


class CriarInscricaoService:
    """Caso de uso responsável por inscrever um usuário em uma palestra."""

    def execute(self, id_usuario, id_palestra, confirmar_choque=False):
        if not Usuario.buscar_por_id(id_usuario):
            raise ValueError("Usuário não encontrado.")

        palestra = ParticipacaoRepository.buscar_palestra_com_bloqueio(id_palestra)
        if not palestra:
            raise ValueError("Palestra não encontrada.")

        if palestra.horario_inicio and palestra.horario_inicio <= datetime.now():
            raise ValueError("As inscrições desta palestra estão encerradas.")

        if ParticipacaoRepository.buscar_inscricao(id_usuario, id_palestra):
            raise ValueError("Usuário já está inscrito nesta palestra.")

        if palestra.vagas_disponiveis <= 0:
            raise ValueError("Não há vagas disponíveis para esta palestra.")

        if not confirmar_choque:
            conflitante = ParticipacaoRepository.buscar_palestra_no_mesmo_horario(
                id_usuario, palestra
            )
            if conflitante:
                # Libera o bloqueio da linha da palestra antes de avisar.
                db.session.rollback()
                raise ChoqueDeHorario(conflitante)

        inscricao = Participacao(id_usuario=id_usuario, id_palestra=id_palestra)
        palestra.vagas_disponiveis -= 1
        db.session.add(inscricao)
        db.session.commit()
        return inscricao
