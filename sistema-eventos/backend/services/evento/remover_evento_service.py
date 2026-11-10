"""
Caso de uso: remover um evento.

CAMADA: Services (regra de negócio do caso de uso "Remover Evento").

Ao remover um evento, o `cascade="all, delete-orphan"` definido na Model
`Evento` garante que suas palestras sejam removidas junto — preservando a
integridade dos dados sem precisar de lógica extra aqui.

Confirmação com senha (F14): apagar um evento apaga também as palestras,
as inscrições, os locais, os patrocinadores e os restaurantes dele, e
não tem volta. Por
isso, além de ser o dono do evento (ou o administrador), conferido no
Controller, a pessoa precisa digitar a própria senha do app. Assim um
celular esquecido aberto não basta para apagar um evento inteiro. A
senha é conferida pelo mesmo Service do login.

Método principal:
    execute(id_evento, usuario, senha): remove o evento ou lança erro.
"""

from backend.models.evento import Evento
from backend.models.restaurante import Restaurante
from backend.services.auth.autenticar_usuario_service import AutenticarUsuarioService


class RemoverEventoService:
    """Caso de uso responsável pela remoção de um evento."""

    def execute(self, id_evento, usuario, senha):
        if not senha:
            raise ValueError("Digite sua senha para confirmar.")
        if AutenticarUsuarioService().execute(usuario.email, senha) is None:
            raise PermissionError("Senha incorreta.")

        # Os restaurantes (F13) não têm `id_evento`: a ligação fica em
        # `restaurante_evento`, que o banco apaga sozinho, mas o restaurante
        # ficaria solto. O commit do `deletar` grava as duas remoções.
        Restaurante.marcar_remocao_do_evento(id_evento)
        removido = Evento.deletar(id_evento)
        if not removido:
            raise ValueError("Evento não encontrado.")
