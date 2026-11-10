"""
Caso de uso: listar os restaurantes de um evento (F13, "Onde comer").

CAMADA: Services (regra de negócio do caso de uso "Listar Restaurantes").

Regras:
- o `id_evento` é obrigatório: cada evento tem os próprios restaurantes;
- o evento precisa existir. Assim, um id errado recebe "Evento não
  encontrado." em vez de uma lista vazia, que pareceria um evento sem
  restaurantes;
- a lista vem do mais perto para o mais longe (ver o Repository).

Uma lista vazia é normal: a funcionalidade é opcional para o organizador,
e o app esconde o atalho "Onde comer" quando não há restaurantes.

Método principal:
    execute(id_evento): retorna a lista de restaurantes (dicts).
"""

from backend.models.evento import Evento
from backend.repositories.restaurante_repository import RestauranteRepository
from backend.repositories.sql_helpers import linha_para_dict


class ListarRestaurantesService:
    """Caso de uso responsável por listar os restaurantes de um evento."""

    def execute(self, id_evento):
        if not id_evento:
            raise ValueError("id_evento é obrigatório.")
        if not Evento.buscar_por_id(id_evento):
            raise ValueError("Evento não encontrado.")

        linhas = RestauranteRepository.listar_por_evento(id_evento)
        return [linha_para_dict(linha) for linha in linhas]
