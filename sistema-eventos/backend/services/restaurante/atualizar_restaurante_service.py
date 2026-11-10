"""
Caso de uso: alterar um restaurante (F13).

CAMADA: Services (regra de negócio do caso de uso "Atualizar Restaurante").

Só os campos de `VALIDACOES` são aceitos; o evento do restaurante nunca
muda por aqui. Cada campo enviado passa pela mesma validação do cadastro.

Método principal:
    execute(id_restaurante, dados): retorna o restaurante atualizado.
"""

from backend.models.restaurante import Restaurante
from backend.services.restaurante.validacoes_restaurante import (
    validar_categoria,
    validar_distancia,
    validar_endereco,
    validar_nome,
    validar_nota,
)

# Campo editável -> função que confere e ajusta o valor.
VALIDACOES = {
    "nome": validar_nome,
    "categoria": validar_categoria,
    "endereco": validar_endereco,
    "distancia": validar_distancia,
    "avaliacao": validar_nota,
}


class AtualizarRestauranteService:
    """Caso de uso responsável pela alteração de um restaurante."""

    def execute(self, id_restaurante, dados):
        alteracoes = {
            campo: validar(dados[campo]) for campo, validar in VALIDACOES.items() if campo in dados
        }
        restaurante = Restaurante.atualizar(id_restaurante, **alteracoes)
        if not restaurante:
            raise ValueError("Restaurante não encontrado.")
        return restaurante
