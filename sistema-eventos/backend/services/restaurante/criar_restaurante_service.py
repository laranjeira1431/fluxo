"""
Caso de uso: cadastrar um restaurante do evento (F13).

CAMADA: Services (regra de negócio do caso de uso "Criar Restaurante").

O restaurante e a ligação com o evento (`restaurante_evento`) são
gravados juntos por `Restaurante.salvar_no_evento`. A conferência do
dono do evento é feita antes, no Controller.

Método principal:
    execute(dados): cria e retorna o novo restaurante.
"""

from backend.models.restaurante import Restaurante
from backend.services.restaurante.validacoes_restaurante import (
    validar_categoria,
    validar_distancia,
    validar_endereco,
    validar_nome,
    validar_nota,
)


class CriarRestauranteService:
    """Caso de uso responsável pelo cadastro de um restaurante."""

    def execute(self, dados):
        if not dados.get("id_evento"):
            raise ValueError("id_evento é obrigatório.")

        return Restaurante.salvar_no_evento(
            dados["id_evento"],
            nome=validar_nome(dados.get("nome")),
            categoria=validar_categoria(dados.get("categoria")),
            endereco=validar_endereco(dados.get("endereco")),
            distancia=validar_distancia(dados.get("distancia")),
            avaliacao=validar_nota(dados.get("avaliacao")),
        )
