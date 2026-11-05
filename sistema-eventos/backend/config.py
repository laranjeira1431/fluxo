"""Configuração central do backend.

As credenciais ficam em variáveis de ambiente. Assim o código pode ser
entregue ao professor sem expor senha de banco no repositório.

O código é o mesmo em todas as máquinas, e o `backend/.env` (fora do Git)
diz como cada uma funciona. Sem configuração, vale sempre a opção mais
segura (P04):

- `SECRET_KEY`: sem padrão. Ela assina os tokens de login, e uma chave
  escrita no código seria conhecida por qualquer pessoa, que poderia
  fabricar um token de qualquer usuário. Por isso a API não sobe sem uma
  chave própria e longa;
- `API_HOST`: só o próprio computador, salvo se o `.env` abrir para a rede;
- `API_DEBUG`: desligado. O modo debug mostra detalhes internos do servidor
  quando há erro e nunca deve ficar ligado na hospedagem;
- `CORS_ORIGENS`: só sites abertos no próprio computador. O CORS é a regra
  que os navegadores seguem para saber quais sites podem chamar a API. O
  app no celular não é navegador, então não passa por ela.
"""

import os
from pathlib import Path

from dotenv import load_dotenv

load_dotenv(Path(__file__).with_name(".env"))

# 32 caracteres barram de uma vez os textos curtos de exemplo, como o
# `troque-esta-chave`, sem precisar de uma lista de valores proibidos.
TAMANHO_MINIMO_CHAVE = 32

# Aceita qualquer porta porque o Flutter no Chrome muda de porta a cada vez.
ORIGENS_LOCAIS = r"^https?://(localhost|127\.0\.0\.1)(:\d+)?$"


def ler_origens_cors():
    """Lê os sites liberados no `.env`, separados por vírgula."""
    origens = os.getenv("CORS_ORIGENS", "").split(",")
    # O navegador envia o endereço sem a barra final, mesmo que ela seja colada.
    limpas = [origem.strip().rstrip("/") for origem in origens]
    return [origem for origem in limpas if origem] or [ORIGENS_LOCAIS]


class Config:
    SECRET_KEY = os.getenv("SECRET_KEY", "")
    SQLALCHEMY_DATABASE_URI = os.getenv(
        "DATABASE_URL",
        "mysql+pymysql://root:@localhost:3306/sistema_eventos",
    )
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JSON_AS_ASCII = False

    # Quem acessa a API (P04): ver a explicação no início deste arquivo.
    API_HOST = os.getenv("API_HOST", "127.0.0.1")
    API_DEBUG = os.getenv("API_DEBUG") == "1"
    CORS_ORIGENS = ler_origens_cors()

    # Imagens enviadas pelo organizador (F14): planta, foto do palestrante
    # e logo do patrocinador. O banco guarda só o nome do arquivo.
    PASTA_UPLOADS = Path(__file__).with_name("uploads")
    # Limite de tamanho de qualquer requisição (5 MB). Acima disso, o
    # Flask recusa o envio antes de o arquivo ser lido.
    MAX_CONTENT_LENGTH = 5 * 1024 * 1024


def validar_configuracao():
    """Impede a API de subir com uma configuração insegura (P04)."""
    if len(Config.SECRET_KEY) < TAMANHO_MINIMO_CHAVE:
        raise RuntimeError(
            f"Defina em backend/.env uma SECRET_KEY com pelo menos "
            f"{TAMANHO_MINIMO_CHAVE} caracteres. Para gerar uma, rode: "
            'python -c "import secrets; print(secrets.token_hex(32))"'
        )
    # O console do modo debug roda código no servidor: aberto para a rede,
    # qualquer aparelho conectado poderia tentar usá-lo.
    if Config.API_DEBUG and Config.API_HOST not in ("127.0.0.1", "localhost"):
        raise RuntimeError(
            "API_DEBUG=1 só funciona com a API restrita a este computador. "
            "Para abrir a API para a rede, tire o API_DEBUG do backend/.env."
        )
