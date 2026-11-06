"""
Caso de uso: cancelar a inscrição de um usuário em uma palestra.

CAMADA: Services (regra de negócio do caso de uso "Cancelar Inscrição").

Ao cancelar, a vaga é devolvida à palestra (respeitando o limite de
`vagas_total`, para nunca ultrapassar a capacidade original).

Regra da F16: depois que a palestra começa, a inscrição não pode mais
ser cancelada. Ela vira o registro de participação, usado para avaliar
(F07) e, no futuro, para o certificado (F12), e a vaga devolvida não
serviria a mais ninguém. Só esconder o botão no app não bastaria: quem
chama a API direto ainda conseguiria cancelar.

As consultas ficam no `ParticipacaoRepository` (P19). O Service decide o
que fazer com o resultado, e o `commit` e o `rollback` ficam aqui.

Método principal:
    execute(id_usuario, id_palestra): remove a Participacao e devolve a vaga.
"""

from datetime import datetime

from backend.extensions import db
from backend.repositories.participacao_repository import ParticipacaoRepository


class CancelarInscricaoService:
    """Caso de uso responsável por cancelar uma inscrição existente."""

    def execute(self, id_usuario, id_palestra):
        inscricao = ParticipacaoRepository.buscar_inscricao(id_usuario, id_palestra)
        if not inscricao:
            raise ValueError("Inscrição não encontrada.")

        palestra = ParticipacaoRepository.buscar_palestra_com_bloqueio(id_palestra)
        if palestra and palestra.horario_inicio and palestra.horario_inicio <= datetime.now():
            db.session.rollback()
            raise ValueError(
                "Não é possível cancelar a inscrição depois que a palestra começou."
            )
        if palestra:
            palestra.vagas_disponiveis = min(
                palestra.vagas_total, palestra.vagas_disponiveis + 1
            )

        db.session.delete(inscricao)
        db.session.commit()
