"""
Caso de uso: marcar como lidas as notificações de um usuário.

CAMADA: Services (regra de negócio do caso de uso "Marcar Avisos como Lidos").

Decidido na F21: ao abrir a aba Avisos, todos os avisos da pessoa viram
lidos de uma vez, inclusive os lembretes. O `UPDATE` fica no
`NotificacaoRepository`, e o `commit` fica aqui, como nos outros Services
que usam um Repository.

Método principal:
    execute(id_usuario): marca como lidas as notificações do usuário.
"""

from backend.extensions import db
from backend.models.usuario import Usuario
from backend.repositories.notificacao_repository import NotificacaoRepository


class MarcarLidasService:
    """Caso de uso responsável por marcar os avisos de um usuário como lidos."""

    def execute(self, id_usuario):
        if not Usuario.buscar_por_id(id_usuario):
            raise ValueError("Usuário não encontrado.")
        NotificacaoRepository.marcar_lidas(id_usuario)
        db.session.commit()
