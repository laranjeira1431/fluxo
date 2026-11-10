"""
Caso de uso: remover um restaurante (F13).

CAMADA: Services (regra de negócio do caso de uso "Remover Restaurante").

A ligação com o evento (`restaurante_evento`) é apagada pelo banco, por
causa do `ON DELETE CASCADE`.

Método principal:
    execute(id_restaurante): remove o restaurante ou lança ValueError.
"""

from backend.models.restaurante import Restaurante


class RemoverRestauranteService:
    """Caso de uso responsável pela remoção de um restaurante."""

    def execute(self, id_restaurante):
        if not Restaurante.deletar(id_restaurante):
            raise ValueError("Restaurante não encontrado.")
