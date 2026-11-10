"""
Model: Restaurante.

CAMADA: Models (entidade de domínio + persistência).

Representa um restaurante perto de um Evento, indicado pelo organizador
na tela "Onde comer" (F13). Herda `db.Model` (tabela `restaurante`) e
`CRUDMixin` (CRUD padrão).

O diagrama liga restaurante e evento pela tabela N:N `restaurante_evento`
(ver `RestauranteEvento`), e o banco continua assim. No app, porém, cada
restaurante é cadastrado por um organizador dentro de UM evento: o
`salvar_no_evento` cria o restaurante e a ligação juntos, e a propriedade
`id_evento` devolve esse evento. Com ela, a conferência de dono
(`verificar_dono_pelo_evento`) funciona igual à do patrocinador.

Remover o restaurante apaga também a ligação (`ON DELETE CASCADE`).
"""

from backend.extensions import db
from backend.models.crud_mixin import CRUDMixin
from backend.models.restaurante_evento import RestauranteEvento


class Restaurante(db.Model, CRUDMixin):
    """Restaurante nas proximidades de um evento."""

    __tablename__ = "restaurante"

    id_restaurante = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(150), nullable=False)
    avaliacao = db.Column(db.Numeric(2, 1))
    distancia = db.Column(db.Numeric(6, 2))
    categoria = db.Column(db.String(80))
    endereco = db.Column(db.String(200))

    @classmethod
    def salvar_no_evento(cls, id_evento, **dados):
        """Cria o restaurante e a ligação com o evento em um só commit.

        `flush` envia o INSERT ao banco sem encerrar a transação: assim o
        `id_restaurante` gerado já existe para montar a ligação. O
        `commit` no final grava as duas linhas juntas; se algo der erro
        antes dele, nenhuma das duas fica no banco.
        """
        restaurante = cls(**dados)
        db.session.add(restaurante)
        db.session.flush()
        db.session.add(
            RestauranteEvento(id_restaurante=restaurante.id_restaurante, id_evento=id_evento)
        )
        db.session.commit()
        return restaurante

    @classmethod
    def marcar_remocao_do_evento(cls, id_evento):
        """Marca para remoção os restaurantes que só estão neste evento.

        Usado ao remover um evento: o `ON DELETE CASCADE` do banco apaga só
        a ligação em `restaurante_evento`, e o restaurante ficaria solto,
        sem ninguém que pudesse editá-lo. Um restaurante ligado também a
        outro evento (possível pelo diagrama, mas não pelo app) é mantido.

        Não faz `commit`: quem chama remove o evento em seguida, e as duas
        remoções são gravadas juntas.
        """
        do_evento = db.session.query(RestauranteEvento.id_restaurante).filter_by(id_evento=id_evento)
        em_outro_evento = db.session.query(RestauranteEvento.id_restaurante).filter(
            RestauranteEvento.id_evento != id_evento
        )
        cls.query.filter(
            cls.id_restaurante.in_(do_evento),
            cls.id_restaurante.notin_(em_outro_evento),
        ).delete(synchronize_session=False)

    @property
    def id_evento(self):
        """O evento ao qual o restaurante está ligado (None se não houver)."""
        ligacao = RestauranteEvento.query.filter_by(id_restaurante=self.id_restaurante).first()
        return ligacao.id_evento if ligacao else None

    def to_dict(self):
        """Serializa o restaurante para JSON."""
        return {
            "id_restaurante": self.id_restaurante,
            "nome": self.nome,
            "avaliacao": float(self.avaliacao) if self.avaliacao is not None else None,
            "distancia": float(self.distancia) if self.distancia is not None else None,
            "categoria": self.categoria,
            "endereco": self.endereco,
            "id_evento": self.id_evento,
        }
