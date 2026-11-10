"""
Repository: Restaurantes do evento (F13).

CAMADA: Repositories (consultas com SQL explícito).

`listar_por_evento` junta `restaurante` e `restaurante_evento` (JOIN),
porque o restaurante não tem a coluna `id_evento`: a ligação fica na
tabela N:N do diagrama. A lista vem do mais perto para o mais longe e,
na mesma distância, em ordem alfabética.
"""

from sqlalchemy import text

from backend.extensions import db


class RestauranteRepository:
    """Consultas SQL explícitas dos restaurantes."""

    @staticmethod
    def listar_por_evento(id_evento):
        """Lista os restaurantes ligados ao evento, do mais perto ao mais longe."""
        sql = text(
            """
            SELECT r.id_restaurante, r.nome, r.avaliacao, r.distancia,
                   r.categoria, r.endereco, re.id_evento
            FROM restaurante r
            JOIN restaurante_evento re ON re.id_restaurante = r.id_restaurante
            WHERE re.id_evento = :id_evento
            ORDER BY r.distancia ASC, r.nome ASC
            """
        )
        resultado = db.session.execute(sql, {"id_evento": id_evento})
        return resultado.mappings().all()
