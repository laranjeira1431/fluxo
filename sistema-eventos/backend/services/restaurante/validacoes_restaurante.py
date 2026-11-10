"""
Validações dos campos do restaurante (F13).

CAMADA: Services (regras usadas pelo cadastro e pela alteração).

Ficam aqui, e não repetidas no Criar e no Atualizar, porque as duas
operações aceitam os mesmos campos com as mesmas regras:
- nome: obrigatório;
- categoria e endereço: opcionais;
- distância (em km): obrigatória, de 0 a 9999,99 (limite da coluna
  DECIMAL(6,2));
- nota: opcional, de 0 a 5 (a nota que o organizador vê, por exemplo,
  no Google).
"""

from backend.services.validacoes_cadastro import (
    TAMANHO_NOME,
    texto_obrigatorio,
    texto_opcional,
)

# Tamanho das colunas no banco (`sistema_eventos_atualizado.sql`).
TAMANHO_CATEGORIA = 80
TAMANHO_ENDERECO = 200
DISTANCIA_MAXIMA = 9999.99
NOTA_MAXIMA = 5


def _numero(valor, mensagem):
    """Converte para float; texto que não é número lança ValueError.

    `bool` é recusado de propósito: em Python, `True` também é um número
    (vale 1), e "distância: true" não faz sentido.
    """
    if isinstance(valor, bool):
        raise ValueError(mensagem)
    try:
        return float(valor)
    except (TypeError, ValueError):
        raise ValueError(mensagem) from None


def validar_nome(valor):
    return texto_obrigatorio(valor, "Digite o nome do restaurante.", TAMANHO_NOME)


def validar_categoria(valor):
    return texto_opcional(valor, "categoria", TAMANHO_CATEGORIA)


def validar_endereco(valor):
    return texto_opcional(valor, "endereço", TAMANHO_ENDERECO)


def validar_distancia(valor):
    """Distância obrigatória, em km."""
    if valor is None or valor == "":
        raise ValueError("Informe a distância até o evento, em km.")
    distancia = _numero(valor, "A distância precisa ser um número, em km.")
    if not 0 <= distancia <= DISTANCIA_MAXIMA:
        raise ValueError("A distância precisa estar entre 0 e 9999,99 km.")
    return round(distancia, 2)


def validar_nota(valor):
    """Nota opcional, de 0 a 5, com uma casa decimal."""
    if valor is None or valor == "":
        return None
    nota = _numero(valor, "A nota precisa ser um número de 0 a 5.")
    if not 0 <= nota <= NOTA_MAXIMA:
        raise ValueError("A nota precisa ser um número de 0 a 5.")
    return round(nota, 1)
