# Fluxo Eventos

Aplicativo para participantes e organizadores de eventos acadêmicos,
feito com **Flutter** (app), **Flask + SQLAlchemy** (API) e **MySQL**
(banco de dados).

- **Problema:** desorganização em eventos. Os participantes têm
  dificuldade para encontrar salas e acompanhar a programação, e o
  controle das inscrições e das informações falha.
- **Solução:** um aplicativo que centraliza os dados do evento e
  facilita tanto a experiência de quem participa quanto o trabalho de
  quem organiza.
- **Público-alvo:** participantes de eventos acadêmicos (palestras,
  semanas temáticas, feiras) e as equipes que organizam esses eventos.

Projeto de conclusão do Curso Técnico em Informática, disciplina
Projeto de Software.

## Equipe

- Anna Eliza Cardoso Campos
- Bianca Tolentino Menezes
- Gabriela Coelho e Sá
- João Pedro Soares Martins
- Manuela Silva Laranjeira
- Rebecca de Normandia Garcia

## Funcionalidades Implementadas

Cada funcionalidade funciona de ponta a ponta: a tela do app chama a
API Flask, e a requisição passa por Controller → Service →
Model/Repository → banco MySQL. Abaixo de cada item estão a tela onde
ela é usada e a rota da API que ela chama.

### Participante

1. **Cadastrar usuário**\
   Login → "Criar conta" · `POST /api/usuarios`
2. **Fazer login**\
   Login · `POST /api/auth/login`
3. **Editar o próprio perfil (nome e e-mail)**\
   Perfil → "Editar perfil" · `PUT /api/usuarios/<id>`
4. **Listar os eventos e escolher um**\
   Início → "Outros eventos" · `GET /api/eventos`
5. **Visualizar a programação do evento**\
   Programação · `GET /api/palestras?id_evento=`
6. **Pesquisar palestras por tema**\
   Programação → lupa · `GET /api/palestras?id_evento=&tema=`
7. **Visualizar os detalhes de uma palestra**\
   Detalhes da palestra · `GET /api/palestras/<id>`
8. **Inscrever-se em uma palestra com controle automático de vagas**\
   Detalhes → "Garantir vaga" · `POST /api/inscricoes`
9. **Avisar choque de horário e encerrar as inscrições de palestras que já começaram**\
   Detalhes → "Garantir vaga" · `POST /api/inscricoes`
10. **Cancelar a inscrição e devolver a vaga**\
    Detalhes → "Cancelar inscrição" · `DELETE /api/inscricoes`
11. **Favoritar e desfavoritar palestras**\
    Detalhes → estrela · `POST` e `DELETE /api/favoritos`
12. **Listar as palestras favoritas**\
    Perfil → Favoritos · `GET /api/favoritos/usuario/<id>`
13. **Consultar a agenda personalizada (palestras inscritas)**\
    Agenda · `GET /api/eventos/<id_usuario>/agenda`
14. **Ativar e desativar o lembrete de uma palestra (no Android, aviso no celular 10 minutos antes do início)**\
    Detalhes → sino · `POST` e `DELETE /api/lembretes`
15. **Consultar os avisos (lembretes, comunicados e inscrições removidas)**\
    Avisos · `GET /api/notificacoes/usuario/<id>`
16. **Avaliar uma palestra com estrelas e comentário (e editar ou excluir a avaliação)**\
    Detalhes → "Avaliar" · `POST`, `PUT` e `DELETE /api/avaliacoes`
17. **Consultar a média e os comentários das avaliações de uma palestra**\
    Detalhes da palestra · `GET /api/avaliacoes/palestra/<id>`
18. **Pesquisar palestrantes pelo nome**\
    Início → "Palestrantes" · `GET /api/palestrantes?id_evento=&busca=`
19. **Visualizar o perfil de um palestrante**\
    Palestrantes → palestrante · `GET /api/palestrantes/<id>`
20. **Visualizar a planta baixa e as salas do evento**\
    Início → "Localização" · `GET /api/eventos/<id>/planta` e `GET /api/locais?id_evento=`
21. **Ver como chegar até a sala de uma palestra**\
    Detalhes → "Como chegar" · `GET /api/palestras/<id>`
22. **Visualizar os patrocinadores do evento**\
    Programação → "Patrocinadores" · `GET /api/patrocinadores?id_evento=`

### Organizador

23. **Listar os eventos que a pessoa organiza**\
    Perfil → Área do organizador · `GET /api/organizador/eventos`
24. **Consultar o painel do evento (inscrições, ocupação das vagas, médias e ranking das palestras)**\
    Área do organizador · `GET /api/organizador/eventos/<id>/painel`
25. **Gerenciar as inscrições (listar os inscritos e remover uma inscrição, que devolve a vaga e avisa a pessoa)**\
    Área do organizador → palestra · `GET /api/organizador/palestras/<id>/inscritos` e `DELETE /api/organizador/palestras/<id>/inscritos/<id_usuario>`
26. **Enviar um comunicado aos inscritos do evento ou de uma palestra**\
    Área do organizador → "Enviar comunicado" · `POST /api/organizador/eventos/<id>/comunicados`
27. **Cadastrar, editar e excluir eventos, com a imagem da planta baixa**\
    Cadastros do evento → "Evento e planta" · `/api/eventos` e `PUT /api/eventos/<id>/planta`
28. **Cadastrar, editar e excluir os locais do evento, com o caminho até cada um**\
    Cadastros do evento → "Locais e rotas" · `/api/locais`
29. **Cadastrar, editar e excluir palestrantes, com foto**\
    Cadastros do evento → "Palestrantes" · `/api/palestrantes`
30. **Cadastrar, editar e excluir palestras**\
    Cadastros do evento → "Palestras" · `/api/palestras`
31. **Cadastrar, editar e excluir patrocinadores, com logo**\
    Cadastros do evento → "Patrocinadores" · `/api/patrocinadores`

O app também tem modo claro e modo escuro e o botão de sair da conta.
Esses dois recursos ficam só no aparelho e não passam pelo banco, por
isso não entram na lista acima.

## Diagrama de classes

O diagrama de classes do domínio, com as 15 Models, seus atributos e
relacionamentos, está em
[`docs/DIAGRAMA_CLASSES.md`](docs/DIAGRAMA_CLASSES.md).

## Onde está cada parte

| Pasta | Conteúdo |
|---|---|
| `sistema-eventos/backend/` | API Flask: `controllers/`, `services/`, `models/` e `repositories/` |
| `sistema-eventos/frontend/Flutter/` | App Flutter |
| `sistema-eventos/database/` | Script que cria o banco MySQL com os dados de demonstração |
| `docs/` | Documentação do projeto e documentos de referência (`arq_ref/`) |

## Como instalar e rodar

O passo a passo completo (banco, API e app), as rotas da API, a
arquitetura e os usuários de teste estão em
[`sistema-eventos/README.md`](sistema-eventos/README.md).
