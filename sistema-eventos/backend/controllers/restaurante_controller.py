"""
Controller: Restaurante.

CAMADA: Controllers (recebe a requisição HTTP e chama o Service certo).

Lista os restaurantes de um evento, usados pela tela "Onde comer" do
Flutter (F13), e deixa o organizador cadastrar, editar e remover os
restaurantes, do mesmo jeito que os patrocinadores.

Acesso (P01 e F08): consultar exige login, como as outras rotas de
consulta; criar, atualizar e remover são só para o organizador dono do
evento (ou um administrador). O evento do restaurante vem da tabela de
ligação, pela propriedade `Restaurante.id_evento`.
"""

from flask import Blueprint, jsonify, request

from backend.controllers.autenticacao import (
    login_obrigatorio,
    somente_organizador,
    verificar_dono_do_evento,
    verificar_dono_pelo_evento,
)
from backend.controllers.utils import tratar_erros
from backend.models.restaurante import Restaurante
from backend.services.restaurante.atualizar_restaurante_service import (
    AtualizarRestauranteService,
)
from backend.services.restaurante.criar_restaurante_service import CriarRestauranteService
from backend.services.restaurante.listar_restaurantes_service import (
    ListarRestaurantesService,
)
from backend.services.restaurante.remover_restaurante_service import (
    RemoverRestauranteService,
)


class RestauranteController:
    """Controller responsável pelos endpoints de restaurantes."""

    @staticmethod
    @tratar_erros
    @login_obrigatorio
    def listar():
        # `type=int`: um valor que não é número vira None, e o Service
        # responde "id_evento é obrigatório.".
        id_evento = request.args.get("id_evento", type=int)
        return jsonify(ListarRestaurantesService().execute(id_evento))

    @staticmethod
    @tratar_erros
    @somente_organizador
    def criar():
        dados = request.get_json() or {}
        # Sem `id_evento`, o Service responde que o campo é obrigatório.
        if dados.get("id_evento"):
            verificar_dono_do_evento(dados["id_evento"])
        restaurante = CriarRestauranteService().execute(dados)
        return jsonify(restaurante.to_dict()), 201

    @staticmethod
    @tratar_erros
    @somente_organizador
    def atualizar(id_restaurante):
        verificar_dono_pelo_evento(Restaurante, id_restaurante, "Restaurante")
        dados = request.get_json() or {}
        restaurante = AtualizarRestauranteService().execute(id_restaurante, dados)
        return jsonify(restaurante.to_dict())

    @staticmethod
    @tratar_erros
    @somente_organizador
    def remover(id_restaurante):
        verificar_dono_pelo_evento(Restaurante, id_restaurante, "Restaurante")
        RemoverRestauranteService().execute(id_restaurante)
        return jsonify({"mensagem": "Restaurante removido."})


restaurante_bp = Blueprint("restaurantes", __name__, url_prefix="/api/restaurantes")
restaurante_bp.add_url_rule("", view_func=RestauranteController.listar, methods=["GET"])
restaurante_bp.add_url_rule("", view_func=RestauranteController.criar, methods=["POST"])
restaurante_bp.add_url_rule(
    "/<int:id_restaurante>", view_func=RestauranteController.atualizar, methods=["PUT", "PATCH"]
)
restaurante_bp.add_url_rule(
    "/<int:id_restaurante>", view_func=RestauranteController.remover, methods=["DELETE"]
)
