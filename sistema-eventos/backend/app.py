from flask import Flask, jsonify
from flask_cors import CORS

from backend.config import Config, validar_configuracao
from backend.extensions import db
from backend.routes import registrar_rotas
from backend import models  # noqa: F401 - registra os Models no SQLAlchemy


def criar_app():
    validar_configuracao()
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app, origins=Config.CORS_ORIGENS)
    db.init_app(app)
    registrar_rotas(app)

    # Envio maior que `MAX_CONTENT_LENGTH` (5 MB, em `config.py`): responde
    # em JSON, como as outras mensagens de erro da API.
    @app.errorhandler(413)
    def envio_grande_demais(_erro):
        return jsonify({"erro": "O envio passa de 5 MB."}), 413

    @app.get("/")
    def inicio():
        return jsonify({"status": "API do Sistema de Eventos no ar"})

    @app.get("/api/health")
    def health():
        return jsonify({"status": "ok"})

    return app


app = criar_app()

if __name__ == "__main__":
    # Execute database/sistema_eventos_atualizado.sql antes de iniciar a API.
    # O SQL mantém também as tabelas que não são usadas diretamente pelo app.
    app.run(host=Config.API_HOST, port=5000, debug=Config.API_DEBUG)
