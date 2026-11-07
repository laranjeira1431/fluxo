"""
Caso de uso: listar as notificações/lembretes de um usuário.

CAMADA: Services (regra de negócio do caso de uso "Listar Notificações").

Método principal:
    execute(id_usuario): retorna a lista de notificações (dicts).

O MySQL guarda `lida` (F21) como 0 ou 1, então o Service converte para
`true` ou `false` antes de responder. Assim, o app recebe o mesmo tipo
que `to_dict()` devolve no Model.
"""

from backend.models.usuario import Usuario
from backend.repositories.notificacao_repository import NotificacaoRepository
from backend.repositories.sql_helpers import linha_para_dict


class ListarNotificacoesService:
    """Caso de uso responsável por listar as notificações de um usuário."""

    def execute(self, id_usuario):
        if not Usuario.buscar_por_id(id_usuario):
            raise ValueError("Usuário não encontrado.")
        linhas = NotificacaoRepository.listar_por_usuario(id_usuario)
        notificacoes = [linha_para_dict(linha) for linha in linhas]
        for notificacao in notificacoes:
            notificacao["lida"] = bool(notificacao["lida"])
        return notificacoes
