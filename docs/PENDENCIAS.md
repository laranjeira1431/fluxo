# Pendências do projeto

Controle central de **tudo** o que precisa ser feito no Fluxo Eventos.
Toda tarefa combinada entra aqui antes de começar e é marcada como
concluída ao final. O registro de como cada tarefa foi resolvida é
opcional e decidido no fim de cada uma.

O arquivo tem duas partes:

1. **Funcionalidades a desenvolver** (F01, F02...): o foco principal do
   trabalho.
2. **Problemas e melhorias** (P01, P02...): erros e ajustes encontrados
   no código existente.

Prioridade: 🔴 alta · 🟡 média · 🟢 baixa
Status: Pendente · Parcial · Em andamento · Concluído

Os caminhos citados nos itens (ex.: `backend/app.py`) partem da pasta
`sistema-eventos/`.

O registro de como cada tarefa foi resolvida (quando combinado) fica em
`DOCUMENTACAO.md`, nesta mesma pasta (`docs/`).

---

# 0. Plano até a entrega

**Apresentação: terça 10/11/2026 ou quarta 11/11/2026. Prazo interno:
segunda-feira, 09/11/2026.** A data de 23/10/2026 ficou para trás, e os
20 RFs estão concluídos.

As prioridades foram revistas em 03/11/2026 com base na rubrica
(`arq_ref/rubrica_projeto_de_conclusao.docx`) e nos requisitos de entrega
(`arq_ref/requisitos_entregas.pdf`). A ordem está na seção 0.2. O que não
for feito fica documentado como "próximos passos".

Cada tarefa segue o passo a passo de `FLUXO_DE_TRABALHO.md` (testar,
commit, push, Pull Request, merge e testar de novo).

## 0.1 Cronograma

### Semana final (04 a 09/11/2026)

Desde 03/11/2026, só a Manuela desenvolve o projeto, e todas as tarefas
ficam com ela. Desde 06/11/2026, o João testa as tarefas concluídas
(cronograma abaixo). A ordem segue os blocos da seção 0.2.

| Dia | Tarefas |
|---|---|
| Qua 04/11 | F29 (concluída) e, na ordem: P16 (concluída), F26 só o erro do e-mail repetido (concluído), P04 (concluída) e F31; F27 se der tempo |
| Qui 05/11 | F27 (concluída) |
| Sex 06/11 | P19 (`ParticipacaoRepository`, concluída) e, na ordem da seção 0.4: F28 (fluxogramas, concluída) e F31 (termos de uso, concluída) |
| Sáb 07/11 | F30 (slides) |
| Dom 08/11 | Corrigir os erros encontrados pelo João, fazer a P22 (refatoração da tela do organizador), testar a P04 no celular e fazer o roteiro do vídeo; depois P03, se der tempo |
| Seg 09/11 | F32 (vídeo) e revisão final; P06 só se os testes mostrarem horário errado |

- **Ordem de 06/11/2026 (decidida pela Manuela):** neste dia, as tarefas
  seguem a seção 0.4, da mais rápida para a mais demorada, e não a ordem
  da seção 0.2. A P20 e a F25 foram puladas e continuam no bloco D, e a
  parte da F25 sobre o painel do organizador foi para a P22.
- **Sem dia reservado para atrasos:** com uma pessoa só no desenvolvimento, o fim de semana
  virou dia de trabalho. Se algo atrasar, o primeiro corte é o que está
  marcado como "se der tempo": a P03. O bloco A não sai da lista.
- **Ordem revista em 05/11/2026 (decidida pela Manuela):** a nova
  análise da rubrica mostrou que a inscrição não passa por um Repository,
  e por isso a P19 entrou antes da F28. Os testes da seção 0.3 ganharam
  um dia, a F31, que não foi feita em 04/11, foi para domingo, e a P06
  deixou de ser obrigatória, porque a aba Avisos já tem um contorno e
  mexer nos horários na véspera da gravação pode criar um erro novo.
- **O bloco A usa os nomes novos:** a F27 e a F28 vêm depois da F29 e já
  usam `salvar()`, `atualizar()`, `deletar()`, `listar_todos()` e
  `buscar_por_id()`.
- **Ordem de 04/11 (decidida pela Manuela):** a F29 ficou pronta antes do
  previsto, e o dia seguiu das tarefas menores para as maiores. A F26 (só
  o e-mail) e a P04 foram adiantadas do domingo, a F31 e a P16 entraram no
  dia, e a F27 pode ser adiantada da quinta. O que for concluído em 04/11
  deixa de valer no dia original. A F31 não foi feita nesse dia: ver a
  ordem revista em 05/11/2026.
- **Fora da semana:** F17, F33 e o restante do bloco D só entram se
  sobrar tempo, na ordem da seção 0.2.
- **Testes no app depois das tarefas (decidido em 03/11/2026):** as
  tarefas da semana são feitas primeiro, e os testes no app ficam para
  depois, todos juntos. Cada tarefa registra na seção 0.3 o que ficou
  para testar. Eles são feitos no domingo, 08/11, antes da gravação do
  vídeo (F32), para sobrar tempo de corrigir o que falhar. Revisto em
  06/11/2026: os testes passam a ser feitos pelo João, a partir desse dia
  (ver abaixo).

### Cronograma do João (testes, 06 a 09/11/2026)

O João usa Mac e testa no emulador Android, sem celular físico. Ele só
testa e relata: quem corrige é a Manuela. Novos testes entram na seção
0.3 conforme as tarefas forem concluídas, então a lista dele vai crescer.

| Dia | Testes |
|---|---|
| Sex 06/11 | Preparar o ambiente, depois F29, F26 e P19. Depois das 21h, P06 |
| Sáb 07/11 | P08 e P16 (parte do Android) |
| Dom 08/11 | Refazer o que falhou e testar o que for concluído até lá |
| Seg 09/11 | Conferir as correções antes da gravação do vídeo |

- **Recriar o banco depois da F31:** a F31 mudou a tabela `usuario`. Na
  primeira rodada depois do merge dela, logo depois do `git pull`, o João
  recria o banco (passo 1.4 do `FLUXO_DE_TRABALHO.md`). Sem isso, o login
  e o cadastro dão erro, e os outros testes falham por esse motivo.
- **Fica com a Manuela:** a P04, que o João não consegue testar pelo cabo
  nem pelo IP. A parte do Windows da P16 continua valendo só se o projeto
  voltar a ser usado no Windows.

### Cronograma original (20 a 23/10/2026)

Mantido como histórico. Duas pessoas, cada uma fazendo a tarefa
completa, do backend à tela, em uma branch própria.

| Dia | Manuela (Pessoa A): base, visual e organizador | Bianca (Pessoa B): telas do participante |
|---|---|---|
| Ter 20/10 | **P11 (`.gitignore`)** → P14 (commit inicial) → **F19 (banco)** → **F20 parte 1 (base visual, com F11)** | F02 notificação local |
| Qua 21/10 | P01, P02, F08 | F01, F06 + F07 (uma tela só, "Avaliar") |
| Qui 22/10 | F14 (com upload de imagem), F09 | F05, F03, F04, F10 (telas de visualização, com dados no SQL) |
| Sex 23/10 | F20 parte 2 (telas restantes), S05/F24 (dados de demonstração com datas futuras), P09 (README), revisão final | Folga para atrasos e itens da seção 0.2; gravação de tela no fim do dia |

- **Por que a P11 vem antes da P14:** a pasta nova ainda não tem
  nenhum commit, então os arquivos locais (`local.properties`,
  `ephemeral/` etc.) ainda não estão no Git. Criando o `.gitignore`
  antes do primeiro commit, eles nunca entram no repositório, e o
  projeto já começa com o padrão para todo mundo.
- **Sincronizações obrigatórias:**
  - **início de terça:** P11 e P14 no GitHub o quanto antes. A Bianca
    só consegue criar a branch da F02 a partir da `main` depois disso;
  - **fim de terça:** F19 e F20 parte 1 na `main`. Na quarta, a Bianca
    começa atualizando a branch a partir da `main`;
  - **quarta:** quando a P01 entrar na `main`, a Bianca atualiza a
    branch, e as rotas novas seguem o mesmo padrão de autenticação.
- **Mudanças da F19 que afetam a Bianca (20/10/2026):**
  - **recriar o banco local** com o script novo antes de começar a
    quarta (passo 1.4 do `FLUXO_DE_TRABALHO.md`);
  - **F06 e F07 viraram uma tela só ("Avaliar"):** a tabela `comentario`
    deixou de existir, e o comentário é agora um campo opcional da
    `avaliacao`, junto com as estrelas. A API `/api/comentarios` virou
    **`/api/avaliacoes`**, já pronta (criar, listar por palestra,
    atualizar e remover). Falta a tela e a média por palestra;
  - **palestrante, local, patrocinador:** as tabelas e Models já
    existem (F05, F04, F10). As tarefas criam as rotas e as telas;
  - a palestra continua devolvendo `sala` na API (agora vem da tabela
    `localizacao`), então as telas que já usam `sala` não mudam.
- **Mudança da P02 que afeta a Bianca (22/10/2026):** o login passou a
  recusar senhas sem hash, e os usuários de exemplo agora têm a senha
  `Senha@123`. Antes da próxima tarefa, **recriar o banco local** com o
  script novo (passo 1.4 do `FLUXO_DE_TRABALHO.md`); sem isso, o login
  com `hash123` deixa de funcionar.
- **Mudança da F14 que afeta a Bianca (22/10/2026):** a tabela
  `palestrante` ganhou `id_evento` (o palestrante é cadastrado por
  evento). Depois que a F14 entrar na `main`, **recriar o banco local**
  com o script novo (passo 1.4 do `FLUXO_DE_TRABALHO.md`). A lista de
  palestrantes da F05 deve filtrar pelo evento
  (`GET /api/palestrantes?id_evento=`).
- **Mudança da F09 que afeta a Bianca (23/10/2026):** a tabela
  `notificacao` ganhou `id_evento`. Depois que a F09 entrar na `main`,
  **recriar o banco local** com o script novo (passo 1.4 do
  `FLUXO_DE_TRABALHO.md`). Para não perder os dados locais, dá para só
  acrescentar a coluna:
  `ALTER TABLE notificacao ADD COLUMN id_evento INT NULL, ADD CONSTRAINT fk_notificacao_evento FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE;`
- **Mudança da S05/F24 que afeta a Bianca (23/10/2026):** os dados de
  exemplo foram trocados (três eventos: acontecendo, futuro e
  encerrado, com datas calculadas no dia em que o script roda; 10
  palestras). As tabelas não mudaram. Depois que a S05 entrar na
  `main`, **recriar o banco local** com o script novo (passo 1.4 do
  `FLUXO_DE_TRABALHO.md`). O que testar com cada usuário está no
  README, em "Dados de demonstração (S05)".
- **Mudança da F04 que afeta a Manuela (23/10/2026):** as descrições dos
  locais de exemplo viraram um passo a passo de verdade (um passo por
  linha). As tabelas não mudaram. Depois que a F04 entrar na `main`,
  **recriar o banco local** com o script novo para ver os passos novos;
  sem recriar, o app funciona com as descrições antigas.
- **Mudança de repositório que afeta todo mundo (03/11/2026):** o
  repositório oficial passou a ser
  <https://github.com/laranjeira1431/fluxo>. Ele é uma cópia exata do
  antigo (`annaelizacc/ProjetoDeSoftware`), com todos os commits e
  branches. Os Pull Requests #1 a #27 não são copiados pelo Git e ficam
  só no repositório antigo, que continua no ar para consulta. Antes da
  próxima tarefa, cada pessoa aponta a própria pasta para o endereço
  novo e confere:
  `git remote set-url origin https://github.com/laranjeira1431/fluxo.git`,
  depois `git remote -v` e `git fetch`. Os Pull Requests novos são
  abertos no repositório novo.
- **Mudança da P17 que afeta todo mundo (03/11/2026):** a versão do
  Flutter da equipe é a **3.47.7**. Depois que a P17 entrar na `main`,
  cada pessoa confere com `flutter --version` e, se for outra, troca
  seguindo o passo 0.3 do `FLUXO_DE_TRABALHO.md`. Sem isso, o
  `pubspec.lock` volta a mudar a cada `flutter pub get`.
- **Por que essa ordem:** a Pessoa A faz as tarefas que as outras usam
  como base (banco, visual, autenticação, área do organizador). A Pessoa
  B começa pelo que não depende de nada.
- **Por que a F11 foi para a Pessoa A:** a nova proposta visual já
  inclui o modo escuro, e as duas mexem no mesmo arquivo
  (`app_theme.dart`). Separadas, causariam conflito no Git. Com isso, a
  Bianca começa pela F02, que não depende do banco nem do tema e é a
  tarefa mais difícil da trilha dela, então ganha mais tempo.
- **Regra do visual:** depois da F20 parte 1, toda tela nova e toda tela
  existente que uma tarefa alterar já seguem o visual novo, usando o
  tema de `app_theme.dart` (nunca cores fixas). Na sexta, a Pessoa A
  passa as telas que ninguém alterou.
- **Telas do participante antes da F14:** F03, F04, F05 e F10 dependem
  da F14 só para o **cadastro** pelo organizador. As telas de
  visualização podem ser feitas antes, com dados colocados direto no SQL.
- **Atenção à carga:** a trilha da Pessoa A está mais cheia. Se atrasar,
  F09 e F10 são as primeiras a cair, e a Bianca pode assumir a F10 na
  sexta.
- **Antes da gravação:** a S05 precisa estar pronta. Sem eventos com
  datas atuais, o Início mostra um evento antigo, a "próxima palestra"
  fica vazia e o aviso de início (F02) não tem o que avisar. A
  inscrição em si não confere a data (isso é a F16). Concluída em
  23/10/2026.
- 📌 **Lembrete para o fim (P09, README):** incluir no README o aviso de
  que o script `database/sistema_eventos_atualizado.sql` **apaga e
  recria** o banco inteiro (`DROP DATABASE`), inclusive dados reais, e
  por isso deve ser rodado **só na instalação**. Depois da entrega,
  mudanças no banco com dados reais devem ser feitas com scripts de
  migração (`ALTER TABLE`), sem recriar o banco.

## 0.2 Ordem de prioridade (rubrica)

Definida em 03/11/2026. A rubrica soma 30 pontos, e a nota final é
limitada a 30. "Arquitetura cliente servidor" e "Organização da API em
camadas" são obrigatórios: o bônus não recupera pontos perdidos neles.

### Bloco A: vale nota ou é obrigatório

| Ordem | Tarefa | Peso | Por que nessa posição |
|---|---|---|---|
| 1 | F29 Nomes dos métodos de CRUD | Exigido nos requisitos | Ligada aos critérios de arquitetura. Vem antes porque o diagrama e os fluxogramas usam esses nomes |
| 2 | F27 Diagrama de classes (concluída) | 3 pontos | Exigido na entrega |
| 2a | P19 Consultas da inscrição no Repository (concluída) | Critério obrigatório e fluxogramas | Vem antes da F28, para o fluxograma de entrada de dados já mostrar o Repository |
| 3 | F28 Fluxogramas dos casos de uso (concluída) | 4 pontos | O maior item que ainda não existe |
| 4 | F30 Slides da apresentação | Ligados a 3 pontos | Exigidos pela rubrica |
| 5 | F32 Vídeo de demonstração | 4 pontos | Sem a demonstração, o projeto não é avaliado. É gravado no último dia, com o que estiver pronto do bloco B |

### Bloco B: protege a nota e o vídeo

| Ordem | Tarefa | Prioridade | Por que nessa posição |
|---|---|---|---|
| 6 | P04 Configuração de desenvolvimento exposta (concluída) | 🟡 | A chave fixa fere a regra de não publicar dados sensíveis. Vem antes da hospedagem |
| 7 | P06 Fuso horário inconsistente | 🟡 | Só entra se os testes mostrarem horário errado. A aba Avisos já tem um contorno |
| 8 | P03 Validações que faltam nos dados recebidos | 🟡 | Corrige erros 500 e campos que ainda não têm validação. O e-mail repetido já foi resolvido na F26 |
| 9 | F26 Editar perfil | 🟡 | O erro do e-mail repetido foi corrigido (04/11/2026). Foto e troca de senha são extras |
| 10 | F17 Logout e login lembrado | 🟡 | Melhora o uso do app, sem efeito direto na nota |
| 11 | Teste da P08 (seção 0.3) | 🟢 | Necessário antes do vídeo só se o lembrete aparecer nele |
| 11a | P22 Refatoração da tela do organizador | 🟡 | Precisa ficar pronta antes da gravação do vídeo (F32) |

### Bloco C: bônus

| Ordem | Tarefa | Peso | Por que nessa posição |
|---|---|---|---|
| 12 | F31 Termos de consentimento (concluída) | 1 ponto | A mudança é pequena |
| 13 | F33 Hospedagem | 2 pontos | A P04, de que dependia, foi concluída |

### Bloco D: sem efeito na rubrica

| Ordem | Tarefa | Prioridade |
|---|---|---|
| 14 | P10 Comentário desatualizado na tela de favoritos (concluída: resolvida na F20) | 🟢 |
| 15 | P07 Método obsoleto do SQLAlchemy (concluída) | 🟢 |
| 16 | P16 Fim de linha diferente entre sistemas (concluída) | 🟡 |
| 17 | P05 Abas do app recarregam a cada troca (concluída) | 🟢 |
| 18 | F21 Marcar avisos como lidos | 🟢 |
| 19 | F25 Total de palestras e salas na lista de eventos da API | 🟢 |
| 20 | F13 Restaurantes próximos | 🟢 |
| 21 | F12 Certificado de participação | 🟢 |
| 22 | F15 Aviso de alteração de palestra | 🟢 |
| 23 | P12 Testes automatizados | 🟢 |
| 24 | F18 Entrar com Google | 🟢 |
| 25 | F22 Perfil de administrador geral | 🟢 |
| 26 | F23 Área do palestrante | 🟢 |
| 27 | S09 Imagem de capa do evento | 🟢 |
| 28 | P20 Cancelamento lê a inscrição antes do bloqueio | 🟢 |

A P13 não entra na lista: ela se resolve quando a F13 for feita. A F03,
a F04 e a F08 já foram concluídas.

## 0.3 Testes pendentes

Testes que não puderam ser feitos na hora em que a tarefa foi concluída
(no celular, no emulador ou no app). O que dá para testar com `curl` é
testado durante a tarefa e registrado no próprio item dela. Cada tarefa
concluída acrescenta aqui os testes que ficaram para depois. Depois do
teste, o status vira "Testado" ou "Falhou: ..." (com o resumo do que
aconteceu).

**Como o João testa e registra:** o João faz os testes com status Pendente
e, a cada teste, informa se deu algum erro ou mau funcionamento. Ele
envia o relato à Manuela (teste, data, resultado, o que aconteceu, passos
e aparelho), e ela registra o resultado aqui. Todo erro entra também na
tabela "Erros encontrados" abaixo, com a situação "Pendente", até a
Manuela resolver. Ele não altera o código nem este arquivo.

| Tarefa | O que testar | Como testar | Onde | Status |
|---|---|---|---|---|
| F31 | O cadastro exige o aceite dos termos, e o Perfil mostra o mesmo texto | Com o banco recriado, tocar em "Criar conta" e preencher os campos. Tocar em "termos de uso": os termos abrem em uma janela. Tentar criar a conta sem marcar a caixa: deve aparecer "Aceite os termos de uso para criar a conta." e a conta não é criada. Marcar a caixa e criar a conta: deve entrar no app. Na aba Perfil, tocar em "Termos de uso", acima de "Sair": os mesmos termos abrem em uma tela própria, sem janela | App (celular ou emulador) | Testado |
| F29 | Criar, listar e remover continuam funcionando com o MySQL | Com o backend ligado ao MySQL, abrir o app e fazer pelo menos: criar um usuário, avaliar uma palestra, favoritar e desfavoritar, ativar e desativar um lembrete e, como organizador, criar e remover uma palestra | App (celular ou emulador) | Pendente |
| P08 | O lembrete aparece cerca de 10 minutos antes da palestra | Permitir as notificações do app, ativar o lembrete de uma palestra que começa em menos de 10 minutos e esperar o aviso na barra do celular. Tocar no aviso deve abrir os detalhes da palestra | Android (celular ou emulador) | Pendente |
| P16 | O Flutter não marca mais arquivos como alterados no Windows, e o app compila com os fins de linha novos | Depois do merge, rodar `flutter run` no Android e, no Windows, conferir que `git status` continua limpo | Android e Windows (só se o projeto voltar a ser usado no Windows) | Pendente |
| F28 | Os dois fluxogramas aparecem desenhados, com as cores das camadas | Depois do push, abrir `docs/FLUXOGRAMAS.md` no GitHub e conferir os dois fluxogramas | GitHub | Testado |
| F27 | Os dois diagramas aparecem desenhados | Depois do push, abrir `docs/DIAGRAMA_CLASSES.md` no GitHub e conferir os dois diagramas | GitHub | Testado |
| F26 | A tela de editar perfil mostra a mensagem do e-mail repetido | No Perfil, abrir "Editar perfil", digitar o e-mail de outra conta e salvar: deve aparecer "Já existe um usuário cadastrado com este email." e a tela continua aberta. Depois, mudar só o nome e salvar: deve funcionar | App (celular ou emulador) | Pendente |
| P04 | O app no celular continua falando com a API depois da mudança de endereço | Pelo cabo: rodar `adb reverse tcp:5000 tcp:5000`, abrir o app, entrar e ver a programação. Pelo IP: colocar `API_HOST=0.0.0.0` no `backend/.env` antes de ligar a API e repetir | Android (celular) | Pendente |
| P06 | A data de uma avaliação feita depois das 21h aparece certa | Depois das 21h, avaliar uma palestra já iniciada em que a pessoa está inscrita e olhar a data do comentário nos detalhes da palestra. Com o erro, aparece o dia seguinte | App (celular ou emulador) | Pendente |
| P19 | Inscrição, cancelamento e choque de horário continuam funcionando no app | Inscrever-se em uma palestra futura com vaga: as vagas caem 1. Cancelar: as vagas voltam. Inscrever-se em duas palestras no mesmo horário (se os dados não tiverem, criar uma como organizador): deve aparecer o aviso de choque, e a inscrição só é feita depois de confirmar | App (celular ou emulador) | Pendente |

### Erros encontrados

Erros relatados nos testes e fora deles, para a Manuela resolver. Depois
de corrigir, a situação vira "Resolvido" e o teste volta para Pendente,
para ser refeito.

| Data | Tarefa | O que aconteceu | Passos | Aparelho | Situação |
|---|---|---|---|---|---|

## 0.4 Tarefas pendentes por tempo de execução

Lista feita em 05/11/2026 e atualizada em 06/11/2026, da tarefa mais
rápida para a mais demorada. Ao concluir uma tarefa, ela sai da tabela e
entra na lista "Já saíram da tabela", logo abaixo.
Os tempos são estimativas, não medições, e consideram desenvolver,
testar, revisar e abrir o Pull Request. A ordem aqui **não** é a ordem de
trabalho: quem define a ordem são as seções 0.1 e 0.2. A exceção é o dia
06/11/2026, que segue esta tabela (ver seção 0.1).

| # | Tarefa | Prioridade | Tempo estimado | Situação |
|---|---|---|---|---|
| 1 | Testes da seção 0.3 (F29, F26, P19, P06, P08 e P16 com o João; P04 com a Manuela) | 🔴 | Cerca de 1 h | 06 a 09/11 |
| 2 | F31 Trocar o texto provisório pelos termos definitivos | 🟢 | Cerca de 15 min | Quando o texto ficar pronto, antes do vídeo |
| 3 | P20 Cancelamento lê a inscrição antes do bloqueio | 🟢 | Cerca de 1 h | Bloco D |
| 4 | F25 Total de palestras e salas na API | 🟢 | 1 a 2 h | Bloco D |
| 5 | P06 Fuso horário inconsistente | 🟡 | 1 a 2 h | Só se os testes mostrarem erro |
| 6 | F21 Marcar avisos como lidos | 🟢 | 2 a 3 h | Bloco D |
| 7 | F15 Aviso de alteração de palestra | 🟢 | 2 a 3 h | Bloco D |
| 8 | S09 Imagem de capa do evento | 🟢 | 2 a 3 h | Bloco D |
| 9 | F32 Vídeo de demonstração | 🔴 | 2 a 3 h | Seg 09/11 |
| 10 | P03 Validações que faltam nos dados recebidos | 🟡 | Cerca de 3 h | Dom 08/11, se der tempo |
| 11 | F30 Slides da apresentação | 🔴 | 3 a 4 h | Sáb 07/11 |
| 12 | F17 Logout e login lembrado (o que falta) | 🟡 | 3 a 4 h | Bloco B, fora da semana |
| 13 | F26 Editar perfil (senha e foto) | 🟡 | 4 a 5 h | Bloco B, fora da semana |
| 14 | F12 Certificado de participação | 🟢 | 4 a 6 h | Bloco D |
| 15 | F13 Restaurantes próximos | 🟢 | 4 a 6 h | Bloco D |
| 16 | F33 Hospedagem do frontend e da API | 🟢 | 4 a 8 h | Bônus, 2 pontos |
| 17 | F22 Perfil de administrador geral | 🟢 | 6 a 8 h | Bloco D |
| 18 | F23 Área do palestrante | 🟢 | 1 dia ou mais | Bloco D |
| 19 | P12 Testes automatizados | 🟢 | 1 dia ou mais | Bloco D |
| 20 | F18 Entrar com Google | 🟢 | 1 dia ou mais | Bloco D |
| 21 | P22 Refatoração da tela do organizador | 🟡 | A estimar | Dom 08/11, antes do vídeo |

**Já saíram da tabela:** P05, P19, F28 e F31 (concluídas) e F34 (cancelada
em 06/11/2026). A F27 e a F29 foram concluídas antes de a lista existir.

- **Revisão dos tempos (05/11/2026):** a S09 caiu de 4 a 6 h para 2 a 3 h,
  porque a tela "Escolher evento" já foi feita na F20 e falta só a imagem
  de capa. A P05 caiu de cerca de 1 h para cerca de 20 min, porque a
  tarefa ficou só em corrigir o comentário do `app_shell.dart`.
- **Total, sem a linha 1 e sem a P22 (ainda sem estimativa):** cerca de
  66 a 85 horas, contando 8 horas
  para cada tarefa de "1 dia ou mais".
- **Só o essencial (F30 e F32):** cerca de 5 a 7 horas.

---

# 1. Funcionalidades a desenvolver

Fonte: `arq_ref/RELATÓRIO01_fluxo-3.pdf` (relatório de elicitação de
requisitos entregue ao professor). Comparação com o código feita em
19/10/2026.

## 1.1 Situação dos 20 requisitos funcionais (RF)

| RF | Requisito (resumo) | Situação | Tarefa |
|---|---|---|---|
| RF01 | Cadastro com e-mail e senha | Concluído | F01 |
| RF02 | Login | Concluído (com ressalvas de segurança: P01, P02) | — |
| RF03 | Programação geral do evento | Concluído | — |
| RF04 | Detalhes das palestras | Concluído | — |
| RF05 | Inscrição com controle automático de vagas | Concluído | — |
| RF06 | Cancelar inscrição | Concluído | — |
| RF07 | Favoritar palestras | Concluído | — |
| RF08 | Agenda personalizada | Concluído | — |
| RF09 | Notificações sobre o início das palestras | Concluído | F02 |
| RF10 | Planta baixa do local | Concluído | F03 |
| RF11 | Rotas até salas e auditórios | Concluído | F04 |
| RF12 | Pesquisar palestras por tema | Concluído | — |
| RF13 | Pesquisar palestrantes pelo nome | Concluído | F05 |
| RF14 | Informações dos palestrantes | Concluído | F05 |
| RF15 | Comentários e feedbacks sobre palestras | Concluído | F06 |
| RF16 | Avaliar palestras por estrelas | Concluído | F07 |
| RF17 | Organizador gerencia inscrições | Concluído | F08 |
| RF18 | Organizador envia comunicados gerais | Concluído | F09 |
| RF19 | Patrocinadores do evento | Concluído | F10 |
| RF20 | Modo claro e modo escuro | Concluído (na F20 parte 1) | F11 |

**Resumo:** os 20 RFs estão concluídos.

## 1.2 Tarefas

Cada tarefa tem um item **"Telas no canvas"** com os nomes das pranchas
que ela usa. O link abre o canvas inteiro (não é possível abrir direto
numa prancha): na página "Telas do projeto · opção 1 refinada", procure
o nome indicado, que aparece acima de cada tela.

| ID | RF | Prioridade | Funcionalidade | Status |
|---|---|---|---|---|
| F01 | RF01 | 🔴 | Tela de cadastro de usuário | Concluído |
| F02 | RF09 | 🔴 | Aviso real de início das palestras | Concluído |
| F03 | RF10 | 🔴 | Planta baixa do evento | Concluído |
| F04 | RF11 | 🔴 | Rotas até salas e auditórios | Concluído |
| F05 | RF13, RF14 | 🔴 | Palestrantes: busca e informações | Concluído |
| F06 | RF15 | 🔴 | Tela de comentários e feedbacks | Concluído |
| F07 | RF16 | 🔴 | Avaliação por estrelas | Concluído |
| F08 | RF17 | 🔴 | Área do organizador: gerenciar inscrições | Concluído |
| F09 | RF18 | 🔴 | Comunicados gerais do organizador | Concluído |
| F10 | RF19 | 🔴 | Patrocinadores do evento | Concluído |
| F11 | RF20 | 🔴 | Modo claro e escuro (feita dentro da F20) | Concluído |
| F12 | — (diagrama) | 🟢 | Certificado de participação | Pendente |
| F13 | — (Seção 1 e diagrama) | 🟢 | Restaurantes próximos (opcional para o organizador) | Pendente |
| F14 | — (S04) | 🔴 | Telas do organizador para cadastrar eventos e palestras | Concluído |
| F15 | RF09, RF18 | 🟢 | Aviso de alteração de palestra na aba Avisos | Pendente |
| F16 | — (S01, S02) | 🟡 | Regras de inscrição: choque de horário e palestra já iniciada | Concluído |
| F17 | — (S03) | 🟡 | Logout e login lembrado | Parcial |
| F18 | — (protótipo) | 🟢 | Entrar com Google | Pendente |
| F19 | — (D01) | 🔴 **primeira** | Atualizar o banco conforme a D01 | Concluído |
| F20 | RF20 (S06) | 🔴 **segunda** | Padronização da interface: aplicar a nova proposta visual (inclui a F11) | Concluído |
| F21 | RF09, RF18 (S08) | 🟢 | Marcar avisos como lidos (contador da barra de navegação) | Pendente |
| F22 | — (sugestão na F08) | 🟢 | Perfil de administrador geral: promover organizadores pelo app | Pendente |
| F23 | — (sugestão na F14) | 🟢 | Área do palestrante: o palestrante entra no app e vê as palestras dele | Pendente |
| F24 | — (S05) | 🔴 | Dados de demonstração: eventos encerrado, acontecendo e futuro | Concluído |
| F25 | — (sugestão na F20) | 🟢 | Total de palestras e salas na lista de eventos da API | Pendente |
| F26 | RF20 (prancha do Perfil) | 🟡 | Editar perfil: e-mail repetido, troca de senha, foto de perfil e revisão de segurança | Parcial |
| F27 | — (S13) | 🔴 | Diagrama de classes do domínio | Concluído |
| F28 | — (S14) | 🔴 | Fluxogramas dos casos de uso | Concluído |
| F29 | — (S15) | 🔴 | Nomes dos métodos de CRUD iguais aos dos requisitos | Concluído |
| F30 | — (S16) | 🔴 | Slides da apresentação | Pendente |
| F31 | — (S17) | 🟢 | Termos de consentimento no cadastro | Concluído |
| F32 | — (S18) | 🔴 | Vídeo de demonstração | Pendente |
| F33 | — (S19) | 🟢 | Hospedagem do frontend e da API | Pendente |

### F01 Tela de cadastro de usuário (RF01)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Cadastro (RF01)", "Login".
- **O que já existe:** a rota `POST /api/usuarios` cria o usuário com a
  senha protegida por hash.
- **O que falta:** a tela de cadastro no Flutter e um link para ela na
  tela de login.
- **Resolvido na P01 (21/10/2026):** o cadastro cria sempre um
  participante e ignora o `tipo_usuario` enviado. A tela não precisa
  (nem deve) mandar esse campo. A rota continua pública.
- **Concluído (21/10/2026):** tela "Criar conta" (link no login), com
  mostrar/ocultar nos dois campos de senha. Depois do cadastro, a pessoa
  já entra no app. O backend confere nome preenchido, e-mail em formato
  válido e senha de 8 a 16 caracteres, no cadastro e na
  atualização, com as regras num lugar só
  (`services/usuario/validacoes_usuario.py`). Registro em
  `DOCUMENTACAO.md`, seção 5.

### F02 Aviso real de início das palestras (RF09)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Notificação no celular (F02)", "Detalhes da palestra (RF04–RF07, RF11, RF15)", "Avisos (RF09, RF18, F15)".
- **O que já existe:** o botão "Ativar lembrete" grava um registro em
  `notificacao`, que aparece na aba Avisos.
- **O que falta:** avisar o usuário de fato quando a palestra estiver
  para começar. Hoje nada acontece no horário.
- **Decidido (20/10/2026):** notificação **local** na barra do celular
  (pacote `flutter_local_notifications`), aparecendo mesmo com o app
  fechado.
  - Só para quem ativou o lembrete, sempre 10 minutos antes do
    `horario_inicio`.
  - Ao ativar o lembrete, o app grava o registro no backend (como hoje)
    e agenda a notificação no celular. Ao desativar o lembrete ou
    cancelar a inscrição, cancela o agendamento.
  - Se faltarem menos de 10 minutos, o aviso aparece na hora ("começa em
    4 minutos"). Se a palestra já começou, o botão "Ativar lembrete" não
    aparece.
  - Se o horário da palestra mudar, o horário da notificação também
    muda: sempre que o app abre, confere os lembretes ativos e reagenda
    os que mudaram.
  - Ao tocar na notificação, o app abre os detalhes da palestra.
- **Descartado:** notificação push (Firebase Cloud Messaging). Exige
  conta no Firebase, guardar o identificador de cada celular e uma tarefa
  agendada no servidor, e nada do que foi pedido precisa que o servidor
  decida quando avisar.
- **Relacionado:** F15 (aviso de alteração na aba Avisos).
- **Concluído (23/10/2026):** `lib/services/lembrete_service.dart` agenda
  a notificação local (pacotes `flutter_local_notifications` e
  `timezone`) ao ativar o lembrete e cancela ao desativar ou cancelar a
  inscrição (que também desliga o lembrete no backend). Ao entrar no
  app, apaga e refaz os avisos a partir dos lembretes do backend. Tocar
  no aviso abre os detalhes; com o app fechado, abre depois do login. O
  sino some quando a palestra já começou. Agendamento "aproximado"
  (pode atrasar 1 ou 2 minutos), porque o exato exige uma permissão que
  o Android 14 nega por padrão. Só no Android; testado num celular pelo
  cabo USB com `adb reverse` (o emulador não abre sem a virtualização
  ligada na BIOS).
  Registro em `DOCUMENTACAO.md`, seção 11.

### F03 Planta baixa do evento (RF10)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Planta do local (RF10)", "Cadastro do evento e planta (F03, F14)".
- **O que já existe:** a tabela `planta_baixa` e a Model `PlantaBaixa`
  (imagem, descrição e evento).
- **O que falta:** a rota na API, a tela no app e a imagem real da planta.
- **Decidido (20/10/2026):** o organizador envia a imagem pelo app ao
  cadastrar o evento (o sistema serve para qualquer evento, sem mudar a
  interface). A imagem é salva em uma pasta do backend (`uploads/`) e o
  banco guarda só o nome do arquivo. O app escolhe a imagem com o pacote
  `image_picker`, envia em uma requisição multipart e exibe com
  `Image.network`. O backend valida o tipo e o tamanho do arquivo.
- **Mesma solução para:** a foto do palestrante (F05) e o logo do
  patrocinador (F10).
- **Depende de:** F14 (telas de cadastro do organizador).
- **Concluído (23/10/2026):** tela "Planta do local"
  (`pages/planta_page.dart`), aberta pelo atalho "Mapa do local" do
  Início. Mostra a imagem com zoom (`InteractiveViewer`, do próprio
  Flutter), a descrição da planta e a lista de locais com o passo a
  passo de como chegar. Sem imagem, avisa que o organizador ainda não
  enviou a planta. A F04 reaproveita a tela no botão "Ver planta".

### F04 Rotas até salas e auditórios (RF11)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Detalhes da palestra (RF04–RF07, RF11, RF15)", "Planta do local (RF10)", "Cadastro de local e rota (F04)".
- **O que já existe:** a tabela `localizacao` (nome do local, descrição e
  evento) e, desde a F19, `palestra.id_localizacao`. As antigas salas em
  texto viraram registros de `localizacao`, e a API continua devolvendo
  o nome do local no campo `sala`.
- **O que falta:** definir o que é uma "rota" no app, guardar esses dados,
  criar a API e a tela.
- **Decidido (D01):** `palestra` passa a apontar para `localizacao`
  (`id_localizacao`), como no diagrama. As salas hoje gravadas como texto
  em `palestra.sala` viram registros em `localizacao`.
- **Decidido (20/10/2026):** a rota é um passo a passo em texto, a
  partir da entrada do evento, escrito pelo organizador para cada local
  (campo `localizacao.descricao`, que já está no diagrama). Nos detalhes
  da palestra, o participante vê o local, o passo a passo e um botão
  "Ver planta" (F03).
- **Descartado:** caminho desenhado na planta (complexo demais) e link
  para mapas externos (não funciona dentro de prédios). Marcar as salas
  na planta pode virar melhoria futura.
- **Depende de:** F14 (telas de cadastro do organizador).
- **Concluído (23/10/2026):** nos detalhes da palestra, a linha "Onde"
  ganhou o botão "Ver planta" (abre a tela da F03) e a seção "Como
  chegar · a partir da entrada" mostra o passo a passo numerado, como na
  prancha do canvas. O backend devolve o texto do local em
  `como_chegar` no JSON da palestra (assim o app não precisa de outra
  chamada), e o app separa os passos pelas linhas, tirando a numeração
  digitada pelo organizador. Os locais de exemplo do SQL ganharam um
  passo a passo de verdade.

### F05 Palestrantes: busca e informações (RF13, RF14)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Palestrantes (RF13)", "Perfil do palestrante (RF14)", "Detalhes da palestra (RF04–RF07, RF11, RF15)", "Cadastro de palestrante (F05)".
- **O que já existe (F19):** a tabela `palestrante`, a Model e
  `palestra.id_palestrante`, com dois palestrantes de exemplo. O tipo
  `'palestrante'` saiu de `usuario`.
- **O que falta:** um lugar para guardar os dados do palestrante (bio,
  foto etc.), a ligação entre palestra e palestrante, a busca por nome,
  a tela de perfil e a exibição do palestrante nos detalhes da palestra.
- **Decidido (20/10/2026):** criar a tabela `palestrante` (`nome`,
  `foto`, `descricao`, `rede_social`), sem login. Cada palestra aponta
  para um palestrante (`palestra.id_palestrante`). No app, os dados
  aparecem em um modal a partir dos detalhes da palestra.
- **Justificativa para a documentação:** o diagrama não tem onde guardar
  os dados do palestrante pedidos pelos RF13 e RF14. Uma tabela própria
  evita repetir os dados quando a mesma pessoa dá mais de uma palestra.
- **Decidido:** um palestrante por palestra. Vários palestrantes só
  fariam sentido com outros tipos de atividade, como workshop (ver S07).
- **Decidido:** o valor `tipo_usuario = 'palestrante'` sai de `usuario`
  (ficam `participante` e `organizador`). A usuária de exemplo Carla
  Souza, hoje palestrante, precisa ser ajustada no SQL.
- **Decidido:** a foto é enviada pelo organizador e salva no backend,
  com a mesma solução da F03.
- **Feito na F14 (23/10/2026):** as rotas de palestrantes por evento
  (`GET /api/palestrantes?id_evento=&busca=`, `GET /api/palestrantes/<id>`)
  e o nome do palestrante (`palestrante`) no JSON das palestras (lista,
  detalhes e agenda). Os detalhes da palestra já mostram a linha
  **Palestrante**, e tocar nela ("Ver perfil") abre o perfil
  (`widgets/perfil_palestrante.dart`, RF14), como a prancha "Perfil do
  palestrante" do canvas. Falta nesta tarefa: a tela de palestrantes do
  participante, com a busca (RF13), que pode reaproveitar o
  `abrirPerfilPalestrante`.
- **Concluído (23/10/2026):** tela "Palestrantes"
  (`pages/palestrantes_page.dart`), aberta pelo atalho do Início. A
  busca chama a API a cada letra digitada; o `FutureBuilder` mostra só
  o resultado da busca mais recente. Tocar num palestrante abre o
  perfil, e tocar numa palestra do perfil abre os detalhes dela.
  Registro em `DOCUMENTACAO.md`, seção 10.

### F06 Tela de comentários e feedbacks (RF15)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Detalhes da palestra (RF04–RF07, RF11, RF15)", "Avaliar palestra (RF16)".
- **Decidido na F19 (20/10/2026):** a tabela `comentario` deixou de
  existir. O comentário é um campo opcional da `avaliacao`, enviado junto
  com as estrelas na tela "Avaliar". Por isso, **F06 e F07 são feitas
  juntas**.
- **O que já existe:** a API completa de avaliações (`/api/avaliacoes`):
  `POST /api/avaliacoes`, `GET /api/avaliacoes/palestra/<id>` (já com o
  nome do autor), `PATCH` e `DELETE /api/avaliacoes/<id>`.
- **O que falta:** mostrar os comentários na tela de detalhes da palestra
  e a tela "Avaliar".
- **Atenção:** relacionado a P01 (qualquer um pode editar ou apagar a
  avaliação de outra pessoa enquanto não houver autenticação).
- **Concluído (22/10/2026), junto com a F07:** os comentários aparecem
  nos Detalhes (autor, nota e data), e a tela "Avaliar" envia o
  comentário junto com as estrelas. A P01 resolveu o ponto de atenção:
  só o autor edita, e o autor ou um organizador remove.

### F07 Avaliação por estrelas (RF16)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Avaliar palestra (RF16)", "Detalhes da palestra (RF04–RF07, RF11, RF15)".
- **O que já existe (F19):** a tabela `avaliacao` (`nota_estrelas` de 1
  a 5, `comentario` opcional) e a API `/api/avaliacoes`. O backend recusa
  nota fora de 1 a 5 e uma segunda avaliação da mesma pessoa para a
  mesma palestra (para mudar a nota, usa-se o `PATCH`).
- **O que falta:** a média por palestra e a exibição no app (feita junto
  com a F06, na tela "Avaliar").
- **Decidido (22/10/2026):** só quem está inscrito avalia, e só a partir
  do `horario_inicio` da palestra (hora local do servidor). A regra fica
  no backend (`motivo_para_nao_avaliar`, em
  `criar_avaliacao_service.py`), e os detalhes devolvem `pode_avaliar`
  para o app esconder o botão. Se a pessoa cancelar a inscrição depois
  de avaliar, a avaliação continua. A média é calculada no SQL (`AVG`) e
  vem na listagem de palestras e nos detalhes.
- **Concluído (22/10/2026), junto com a F06:** tela "Avaliar" (criar,
  editar e excluir a própria avaliação), seção "Avaliações e
  comentários" nos Detalhes e média nos cards da Programação. As telas
  de Detalhes e o card da Programação passaram para o visual novo.

### F08 Área do organizador: gerenciar inscrições (RF17)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Perfil — organizador (F08)", "Área do organizador", "Inscrições (RF17)".
- **O que já existe:** a tabela `organizador` (com `nivel_acesso`) e um
  organizador de exemplo (Bruno Costa).
- **O que falta:** reconhecer o organizador no login, ver a lista de
  inscritos de cada palestra, gerenciar inscrições e criar as telas
  correspondentes.
- **Depende de:** P01 (autenticação), para que só organizadores acessem
  essas funções.
- **Decidido (20/10/2026):** a entrada "Área do organizador" fica no
  Perfil e aparece **só** para organizadores. Participantes não veem a
  opção.
- **Decidido (22/10/2026):**
  - o app reconhece o organizador pelo `tipo_usuario` que o login já
    devolve. Os organizadores continuam sendo criados pelo banco; criar
    pelo app virou a F22;
  - a "Área do organizador" é um painel do evento: palestras, inscrições,
    esgotadas, ocupação das vagas (%) e média das avaliações, mais o
    ranking das palestras (inscritos/vagas e média de cada uma);
  - gerenciar inscrições = ver os inscritos de cada palestra (com busca)
    e remover uma inscrição, com confirmação antes. A remoção usa o mesmo
    `CancelarInscricaoService` do participante (a vaga volta) e grava um
    aviso do tipo `atencao` para a pessoa removida;
  - **cada evento tem um só organizador responsável**
    (`evento.id_organizador`). O organizador vê e gerencia só os
    próprios eventos (painel, inscrições, evento, palestras e moderação
    de avaliações); o administrador (`nivel_acesso = 'administrador'`)
    vê e gerencia todos. Quem cria o evento (`POST /api/eventos`) vira o
    responsável, e o responsável não pode ser trocado pela API;
  - fluxo previsto: o administrador cria o organizador (F22; até lá, pelo
    banco) e o organizador cria o evento, que já fica ligado a ele (F14);
  - o painel mostra só os eventos da pessoa. Com mais de um, aparece o
    seletor "Trocar evento" do canvas.
- **Concluído (22/10/2026):** rotas `/api/organizador/...` (meus
  eventos, painel, inscritos e remover, só para organizadores e só nos
  próprios eventos) e as telas "Área do organizador" e "Inscrições". No
  painel, o comunicado (F09) e os cadastros (F14) aparecem como "Em
  breve". No banco, a coluna `evento.id_organizador` e a organizadora de
  exemplo Elisa Prado (evento 2). Junto, o botão **Sair** do Perfil
  (parte da F17), por decisão da Manuela de fazer na mesma branch.
  Ajustes da revisão: listar, ver e remover contas de outras pessoas
  ficou só para o administrador; quem é responsável por eventos não pode
  ser removido; a atualização de evento e de palestra aceita só uma
  lista de campos permitidos (avanço na P03).

### F09 Comunicados gerais do organizador (RF18)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Enviar comunicado (RF18)", "Avisos (RF09, RF18, F15)".
- **O que já existe:** a tabela `notificacao`, mas ela exige
  `id_palestra`. Um comunicado geral não pertence a uma palestra.
- **O que falta:** um lugar no banco para o comunicado, a rota para o
  organizador enviar e a exibição na aba Avisos.
- **Decidido (D01):** a tabela `mensagem` do diagrama não será criada.
  O comunicado usa a tabela `notificacao`, adaptada para aceitar
  notificações sem palestra (`id_palestra` opcional).
- **Depende de:** F08 e P01.
- **Concluído (23/10/2026):**
  - **Decidido:** o comunicado vai para quem está inscrito em pelo menos
    uma palestra do evento, e cada pessoa recebe uma cópia em
    `notificacao` (`tipo_notificacao = 'comunicado'`). Quem está inscrito
    em várias palestras recebe uma só (`SELECT DISTINCT`).
  - **Decidido (pedido da Manuela):** no campo **Para**, uma lista
    suspensa deixa escolher, em vez de todos, **uma** palestra do evento
    (uma por vez); só os inscritos nela recebem. Palestras sem inscritos
    aparecem desativadas. O backend confere se a palestra é do evento.
  - **Decidido:** na aba Avisos, o comunicado mostra o nome do evento e,
    quando foi para uma palestra, também o título dela. Para isso, a
    tabela `notificacao` ganhou o campo **`id_evento`** (opcional,
    preenchido só nos comunicados). Sem ele, o comunicado para todos não
    teria como saber de qual evento veio.
  - Rota `POST /api/organizador/eventos/<id>/comunicados` (só o dono do
    evento), com mensagem obrigatória de até 500 caracteres e
    `id_palestra` opcional; sem nenhum inscrito, dá erro 400. As cópias
    são gravadas numa transação só.
  - Tela "Enviar comunicado", aberta pelo painel, com confirmação antes
    de enviar. A aba Avisos passou para o visual do canvas (ver F20).
  - **Fora desta tarefa:** o cartão "Começa em 10 min" do canvas
    (próximo lembrete) depende da F02; o contador de novos depende da
    F21.

### F10 Patrocinadores do evento (RF19)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Patrocinadores (RF19)", "Cadastro de patrocinador (F10)".
- **O que já existe (F19):** a tabela `patrocinador` (nome da empresa,
  logo, site e descrição, ligada ao evento), a Model e um patrocinador
  de exemplo.
- **O que falta:** a API e a tela.
- **Decidido (D01):** criar a tabela `patrocinador` seguindo o diagrama.
- **Decidido:** o logo é enviado pelo organizador e salvo no backend,
  com a mesma solução da F03.
- **Concluído (22/10/2026):** rota `GET /api/patrocinadores?id_evento=`
  (login obrigatório; evento inexistente ou `id_evento` faltando dão
  erro 400) e tela "Patrocinadores", aberta pelo botão no topo da
  Programação, em grade de duas colunas como no canvas.
  - **Decidido:** enquanto a F14 não traz o envio do logo, o card mostra
    as iniciais da empresa ("TechNova" → "TE") num quadro colorido. O
    site aparece como texto selecionável; o link clicável (pacote
    `url_launcher`) fica para depois da P17, porque um pacote novo muda
    o `pubspec.lock`.
  - **Fica para a F14 (Manuela):** cadastro de patrocinador pelo
    organizador e envio do logo; a tela passa a mostrar a imagem no
    lugar das iniciais quando `logo` vier preenchido.

### F11 Modo claro e escuro (RF20)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Perfil — participante (RF20, F17)", "Início — modo escuro", "Detalhes — modo escuro".
- **O que já existe:** um tema claro centralizado em
  `frontend/Flutter/lib/theme/app_theme.dart`, o que facilita criar o
  tema escuro.
- **O que falta:** o tema escuro e um botão para alternar entre os dois.
- **Atenção:** algumas telas usam cores fixas fora do tema (por exemplo,
  a splash e a tela de detalhes), e elas precisarão ser revistas.
- **Decidido (D01):** sem o campo `tema_preferido` no banco. A escolha
  do tema fica guardada no próprio celular.
- **Concluído (F20 parte 1):** tema escuro em `app_theme.dart` e o
  interruptor "Modo escuro" no Perfil, com a escolha salva no celular
  (`lib/theme/controle_tema.dart`). Registro em `DOCUMENTACAO.md`,
  seção 3. As telas que ainda faltam no visual novo (F20 parte 2) já
  usam as cores do tema, então também mudam no modo escuro.

### F12 Certificado de participação (diagrama do relatório)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Certificados (F12)".
- **O que já existe (F19):** a tabela `certificado` (`id_usuario`,
  `id_evento`, `codigo_validacao` único, `data_emissao`, sem o campo sem
  nome `Atributo_1`) e a Model. Cada usuário tem no máximo um
  certificado por evento.
- **O que falta:** a API e a tela.
- **Decidido (D01):** o certificado é emitido para quem participou do
  evento. Garantir a vaga em uma palestra (inscrição) vale como
  confirmação de presença, então não há lista de presença separada.
- **Decisão necessária (ao planejar):** quando o certificado fica
  disponível (ao fim do evento?), como é entregue (tela no app, PDF) e
  como o código de validação é conferido.

### F13 Restaurantes próximos (Seção 1 e diagrama do relatório)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Onde comer (F13, opcional)". A tela de cadastro de restaurantes do organizador ainda não foi desenhada.
- **O que já existe:** as tabelas `restaurante` (nome, endereço,
  categoria, distância, avaliação) e `restaurante_evento`, e as Models.
  Não há API nem tela.
- **O que falta:** o organizador poder cadastrar restaurantes no evento
  e o participante poder vê-los no app.
- **Decidido:** a funcionalidade é opcional para o organizador. Se o
  evento não tiver restaurantes cadastrados, o app não mostra a seção.
- **Não é um dos 20 RFs:** registrar isso na documentação final.
- **Depende de:** F08 e P01 (área do organizador).

### F14 Telas do organizador para cadastrar eventos e palestras (S04)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Área do organizador", "Cadastro do evento e planta (F03, F14)", "Cadastro de palestra (F14)", "Cadastro de local e rota (F04)", "Cadastro de palestrante (F05)", "Cadastro de patrocinador (F10)", "Componente: formulário do organizador".
- **O que já existe:** a API de CRUD de eventos e palestras. Hoje um
  evento só pode ser criado direto no banco.
- **O que falta:** as telas no app para o organizador cadastrar e editar
  o evento (com a planta baixa, F03), os locais com o passo a passo da
  rota (F04), as palestras com o palestrante (F05) e os patrocinadores
  (F10).
- **Por que é necessária:** o sistema serve para qualquer evento sem
  mudar a interface, então tudo o que é do evento precisa ser cadastrado
  pelo organizador no app.
- **Já pronto na F08 (22/10/2026):** o evento criado por
  `POST /api/eventos` fica ligado a quem o criou, e só esse organizador
  (ou um administrador) altera o evento e as palestras dele. As rotas
  novas desta tarefa (locais, planta, palestrantes, patrocinadores)
  devem usar `verificar_dono_do_evento` (em
  `controllers/autenticacao.py`) do mesmo jeito.
- **Decidido (22/10/2026), com a Manuela:**
  - **fluxo das telas:** o painel do organizador ganha "Novo evento" e,
    em "Cadastros do evento", uma lista com formulário para cada item,
    nesta ordem: Evento e planta, Locais e rotas, Palestrantes, Palestras
    e Patrocinadores (a palestra escolhe um local e um palestrante já
    cadastrados);
  - **palestrante é do evento:** a tabela `palestrante` ganha
    `id_evento`. O organizador cadastra o palestrante uma vez no evento e
    o indica em algumas palestras. A mesma pessoa só tem dois cadastros
    se falar em eventos diferentes. A palestra só aceita palestrante do
    próprio evento;
  - **upload:** a imagem vai primeiro para `POST /api/uploads`, que
    devolve o nome do arquivo; o cadastro grava esse nome. Aceita PNG,
    JPG e WEBP de até 5 MB, salvo com nome aleatório. O formulário mostra
    um aviso pequeno com os tipos aceitos;
  - **excluir evento:** o dono do evento ou o administrador, sempre
    digitando a própria senha do app para confirmar, porque apaga também
    as palestras e as inscrições;
  - **imagem trocada:** o arquivo antigo continua na pasta `uploads/`.
    Apagar os arquivos sem uso fica como melhoria futura.
- **Depende de:** P01 e F08.

### F15 Aviso de alteração de palestra na aba Avisos

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Avisos (RF09, RF18, F15)".
- **O que falta:** quando o organizador alterar o local, o horário ou
  outro dado de uma palestra, os inscritos recebem um aviso na aba
  Avisos do app.
- **Decidido (20/10/2026):** o aviso aparece só dentro do app, na aba
  Avisos (não na barra do celular). Fica para depois das tarefas
  principais.
- **Decisão necessária (ao planejar):** quem recebe (todos os inscritos
  ou só quem ativou o lembrete) e quais alterações geram aviso.
- **Depende de:** F14 (edição da palestra pelo organizador) e F09
  (`notificacao` adaptada).

### F16 Regras de inscrição: choque de horário e palestra já iniciada (S01, S02)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Aviso de choque de horário (F16)", "Detalhes da palestra (RF04–RF07, RF11, RF15)".
- **O que acontece hoje:** é possível se inscrever em duas palestras no
  mesmo horário e em palestras que já começaram ou terminaram.
- **Decidido (20/10/2026):**
  - **Choque de horário (S01):** a inscrição **não é bloqueada**. O app
    mostra um modal: "Você já tem inscrição em uma palestra nesse
    horário. Deseja mesmo se inscrever nesta?". Se a pessoa confirmar, a
    inscrição é feita. O texto é neutro para não presumir o gênero de
    quem usa o app (ajustado em 20/10/2026).
  - **Palestra já iniciada ou encerrada (S02):** a inscrição é
    bloqueada pelo backend, e o app não mostra o botão de inscrição.
  - **Visual da palestra encerrada (23/10/2026):** a palestra que já
    terminou aparece acinzentada, com a tag **"Encerrada"**, no mesmo
    estilo da tag de esgotada. A palestra que já começou e ainda não
    terminou também não aceita inscrição.
  - **Card do evento no Início (23/10/2026):** o card (banner do topo)
    mostra a situação do evento com uma tag no mesmo estilo da de
    esgotada: **"ACONTECENDO AGORA"**, **"ENCERRADO"** ou o tempo que
    falta (ex.: **"EM 14 DIAS"**). O evento encerrado fica com o card
    acinzentado, e o botão "Ver programação" vira **"Ver avaliações"**.
    Origem: teste da S05, em que a Mostra de Projetos (encerrada)
    aparecia igual aos outros eventos.
  - **Cancelamento depois do início (23/10/2026):** o backend também
    recusa cancelar a inscrição numa palestra que já começou (em
    andamento ou encerrada). A inscrição numa palestra que já aconteceu é
    o registro de participação, usado para avaliar (F07) e, no futuro,
    para o certificado (F12); e a vaga devolvida não serve a mais
    ninguém. Esconder o botão no app não basta: quem chama a API direto
    ainda conseguiria cancelar.
  - **Detalhes de palestra em andamento ou encerrada (23/10/2026):** o
    cartão de vagas some. Na barra de baixo, quem estava inscrito vê só a
    estrela de favoritar (pequena) e o botão **Avaliar** (ou **Editar
    avaliação**); quem não estava inscrito não vê nenhum botão. O
    lembrete também some. A parte visual entra na F20 (commit dos
    Detalhes); o bloqueio no backend fica nesta tarefa.
  - **Decisão necessária (ao planejar):** o que o botão "Ver
    avaliações" abre. Ainda não existe tela com as avaliações de um
    evento; a Programação já mostra a média de cada palestra.
  - **Para testar:** os dados da S05 têm palestras encerradas, uma
    acontecendo ("Segurança da Informação") e futuras. A que está
    acontecendo só vale por 2 a 3 horas depois de o script rodar, então
    recriar o banco antes de testar.
- **Onde:** no Service que cria a inscrição (`CriarInscricaoService`) e
  na tela de detalhes da palestra.
- **Decidido (23/10/2026):** o app informa a confirmação com
  `confirmar_choque: true` no corpo de `POST /api/inscricoes`. Sem ela, o
  backend responde 409 com `choque_horario: true` e a palestra que bate
  no horário, e o app mostra o aviso.
- **Decidido (23/10/2026):** "Ver avaliações" abre uma tela com as
  palestras do evento, a média e o total de avaliações de cada uma (da
  maior para a menor média); tocar numa palestra abre os detalhes, com
  os comentários.
- **Feito (23/10/2026):** choque de horário completo (backend, aviso no
  app como a prancha do canvas, README) e a estrutura da tela
  "Avaliações do evento" (`pages/avaliacoes_evento_page.dart`), ainda
  sem botão que a abra.
- **Concluído (23/10/2026, parte 2):** o backend recusa a inscrição e o
  cancelamento depois do início da palestra (`horario_inicio <= agora`,
  o mesmo critério da avaliação, F07), com erro 400. O card do evento no
  Início mostra a tag de situação (ACONTECENDO AGORA, EM N DIAS, AMANHÃ
  ou ENCERRADO, contada por dia, porque o evento só tem a data); o
  evento encerrado fica cinza e o botão vira "Ver avaliações", que abre
  `pages/avaliacoes_evento_page.dart`. A tag "Encerrada" da Programação
  e a barra dos Detalhes de palestra começada ficaram na F20
  (Manuela).

### F17 Logout e login lembrado (S03)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Login", "Perfil — participante (RF20, F17)".
- **O que acontece hoje:** o Perfil já tem o botão **Sair**, mas o app
  pede o login toda vez que é aberto.
- **O que falta:** manter a pessoa conectada ao reabrir o app, até ela
  sair, voltar ao login no erro 401 e encerrar o token no servidor
  (detalhes abaixo).
- **Relacionado:** P01 (autenticação). Desde a P01, o login devolve um
  token que vale 8 horas e fica só na memória (`ApiService.token`).
  Manter o login é guardar esse token no aparelho e, no "Sair", apagá-lo.
- **Decidido (21/10/2026):** quando a API responder 401 (token vencido
  ou inválido), o app deve voltar sozinho para a tela de login. Hoje a
  tela só mostra a mensagem "Sessão expirada ou inválida".
- **Parcial (22/10/2026, feito na branch da F08):** o botão **Sair** do
  Perfil apaga o token e volta para o login, sem deixar "voltar" com o
  botão do celular. Falta manter o login ao reabrir o app e a volta
  automática ao login no 401.
- **Sair também no servidor (S10, aprovada em 23/10/2026):** hoje o
  `POST /api/auth/logout` só responde "Apague o token no app". O token
  continua valendo no servidor até vencer (testado em 23/10/2026: depois
  do logout, o mesmo token ainda listou as palestras). Quem copiou o
  token consegue usá-lo por até 8 horas. Uma solução simples é guardar
  no banco os tokens encerrados (uma "lista de bloqueio", ou
  *blocklist*) e recusar esses tokens na autenticação. Tarefa de
  segurança: `/security-review` antes do commit. Ao concluir, atualizar
  também os textos que tratam isso como "próximo passo": a limitação da
  P01, a `DOCUMENTACAO.md` e a docstring do
  `backend/controllers/auth_controller.py` ("O logout não precisa fazer
  nada no servidor").

### F18 Entrar com Google

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Login", "Cadastro (RF01)".
- **Origem:** o protótipo do Figma tinha login social (Google, GitHub e
  Facebook). A equipe decidiu manter só o Google (20/10/2026).
- **O que acontece hoje:** só existe login com e-mail e senha.
- **O que falta:** o botão "Continuar com Google" no login, a
  configuração do projeto no Google Cloud (credenciais OAuth) e uma rota
  no backend que confirme a identidade enviada pelo Google e crie ou
  encontre o usuário correspondente.
- **Banco já preparado (F19, 20/10/2026):** `usuario.senha` aceita vazio
  (quem entra pelo Google não tem senha) e existe `usuario.google_id`
  (único). O login por e-mail e senha já recusa usuários sem senha. Se a
  F18 for feita, não precisa mexer no banco.
- **Ícones já no app (F01, 21/10/2026):** a fileira de ícones sociais
  saiu do login na F01, mas as imagens `faceIcon.png`, `googleIcon.png`
  e `gitIcon.png` continuam em `assets/images/`. Na F18, usar o
  `googleIcon.png` no botão "Continuar com Google" e apagar os outros
  dois, que não serão usados.
- **Atenção:** é a tarefa nova mais trabalhosa. Envolve configuração
  fora do código (Google Cloud) e um conceito novo, o OAuth, que precisa
  ser bem explicado. Com a entrega em 23/10/2026, a prioridade deve ser
  decidida pela equipe.
- **Relacionado:** P01 (autenticação) e F17 (login lembrado).

### F19 Atualizar o banco conforme a D01 (prioridade máxima)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** nenhuma. A tarefa mexe só no banco.
- **Por que existe:** as decisões da D01, F05 e F09 mudam várias tabelas
  do mesmo arquivo SQL e várias Models. Se cada pessoa mudasse o banco
  dentro da própria tarefa, as duas editariam os mesmos arquivos ao mesmo
  tempo e o Git acusaria conflito. Por isso, todas as mudanças são feitas
  de uma vez, por uma pessoa só (Pessoa A), antes das outras tarefas que
  usam o banco.
- **O que muda** (`database/sistema_eventos_atualizado.sql` e
  `backend/models/`):
  - criar `palestrante` (`nome`, `foto`, `descricao`, `rede_social`) e
    `palestra.id_palestrante` (F05);
  - criar `avaliacao` (`nota_estrelas`, `comentario`, `id_usuario`,
    `id_palestra`) e remover `comentario.nota` (F07);
  - criar `patrocinador` (`nome_empresa`, `logo`, `site`, `descricao`,
    `id_evento`) (F10);
  - criar `certificado` (`id_usuario`, `id_evento`, `codigo_validacao`,
    `data_emissao`), sem `Atributo_1`. Só a tabela e a Model: a
    funcionalidade (F12) fica para depois, mas o banco já fica fiel ao
    diagrama;
  - ligar `palestra` a `localizacao` (`palestra.id_localizacao`),
    transformando os textos de `palestra.sala` em registros de
    `localizacao` (F04);
  - deixar `notificacao.id_palestra` opcional (F09);
  - remover o valor `'palestrante'` de `tipo_usuario` e ajustar a
    usuária de exemplo Carla Souza (F05).
- **Decidido (20/10/2026):**
  - a tabela `comentario` deixa de existir: o comentário fica só em
    `avaliacao`, junto com as estrelas. A API de comentários foi adaptada
    para `/api/avaliacoes`, para a F06/F07 já começar com o backend
    pronto;
  - uma avaliação por pessoa e palestra (chave única), como em inscrição
    e favorito, para a média não ser distorcida;
  - o exemplo antigo (nota 9,5 de 10) virou 5 estrelas;
  - preparo para a F18, sem implementá-la: `usuario.senha` aceita vazio e
    existe `usuario.google_id`. O login por e-mail e senha recusa quem
    não tem senha.
- **Concluído (20/10/2026).** Quem já tinha o banco local precisa
  recriá-lo com o script novo.
- **Depende de:** P14 (commit da versão atual, para ter um ponto seguro
  antes de mexer no banco).

### F20 Aplicar a nova proposta visual (S06, inclui a F11)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** a página inteira "Telas do projeto ·
  opção 1 refinada", com destaque para "Identidade visual",
  "Componente: barra de navegação" e os modos escuros.
- **Origem:** a nova proposta visual (S06), definida pela Manuela em
  outra conversa, que corrige problemas do protótipo do Figma e já
  inclui o modo escuro (RF20).
- **Responsável:** Pessoa A (Manuela).
- **Referência visual:** a página "Telas do projeto · opção 1 refinada"
  do [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt), com
  todas as telas do projeto. As cores e fontes ficam em
  `frontend/Flutter/lib/theme/app_theme.dart`.
- **Parte 1 (terça, base):** cores, fontes, tema claro e tema escuro em
  `frontend/Flutter/lib/theme/app_theme.dart`, os componentes
  compartilhados em `lib/widgets/` e o botão para alternar o tema, com a
  escolha salva no celular (F11). Precisa estar na `main` até o fim de
  terça, porque as telas novas da Bianca já são feitas sobre ela.
- **Parte 2 (sexta, telas restantes):** aplicar o visual nas telas que
  nenhuma outra tarefa alterou (por exemplo, splash, home, programação,
  agenda e favoritos). As cores dessas telas já foram trocadas pelas do
  tema na parte 1 (o modo escuro funciona nelas); falta o layout.
  - **Início: feito na branch da F14 (23/10/2026).** Nos testes da F14,
    a participante não tinha onde ver as informações principais do
    evento. O Início passou a seguir a prancha do canvas: o card do
    evento (datas, nome, local e **Ver programação**), os atalhos (os
    sem tela aparecem como "Em breve"), a descrição e a próxima palestra
    da agenda. Começa pelo próximo evento; com mais de um, a lista
    **Trocar evento** acima do card troca o evento.
  - **Aba Programação no evento do Início (sugestão aprovada em
    23/10/2026):** a aba abria sempre o primeiro evento. Agora abre o
    escolhido em "Trocar evento" ou, sem escolha, o próximo evento
    (`escolherEvento`, em `home_page.dart`). Feito na branch da F14.
  - **Avisos: feito na branch da F09 (23/10/2026).** Cabeçalho do
    canvas, lista com o horário em JetBrains Mono (hora para hoje,
    `ONTEM`, ou a data), selo por tipo (`ORGANIZAÇÃO` na cor Areia,
    `ATENÇÃO`, `LEMBRETE`, `INFO`) e puxar para recarregar. Os ícones em
    imagem saíram.
  - **Andamento da parte 2 (23/10/2026, fim do dia):** feitos e
    commitados abertura, favoritos, programação e agenda (commits 1 a
    4). **Falta, nesta ordem:** avisos (5), detalhes (6),
    perfil (7), início (8) e documentação (9: README, este arquivo com a
    F20 concluída, os próximos passos e o `/code-review` antes
    do último commit). A `main` (com F03, F04 e F05 da Bianca) já foi
    trazida para a branch; antes do Pull Request, trazer de novo se
    houver novidades.
  - **Céu suave e eventos, lugares e salas (aprovado em 23/10/2026,
    noite):** a Manuela criou no canvas as páginas "Opção · fundo céu" e
    "Proposta · eventos, lugares e salas" e escolheu o **céu suave** para
    o app todo e as telas novas da proposta. Para não mudar a regra do
    `CLAUDE.md` (a fonte oficial é a página refinada), a própria página
    refinada foi atualizada: fundo céu suave `#E3F3FF` (linhas
    `#BFDDF2`, bordas `#9CC8E6`, texto secundário `#3E5A73`, blocos
    `#CFE9FB`, estrelas `#8A6420`; o modo escuro não muda), o Início com o
    cartão "Você está no evento · Outros eventos (N)" no lugar da lista
    **Trocar evento** (o resto do Início fica igual), a nova prancha
    "Escolher evento" e a Planta do lugar com o nome do lugar e a lista
    "Salas e como chegar". Como o PR #21 (commits 1 a 4) já entrou na
    `main`, o restante da parte 2 segue na branch `f20-ceu-e-eventos`, um
    commit por tela: tema (1), avisos (2), detalhes (3), planta do lugar
    (4), escolher evento e cartão do Início (5), perfil (6), início (7) e
    documentação (8).
  - **Plano da parte 2 (aprovado em 23/10/2026), um commit por tela,
    na branch `f20-telas-restantes`:** abertura (com o rio de espessura
    fixa, centralizado e sem deformar em telas largas), favoritos,
    programação, agenda, avisos, detalhes, perfil e início, e por fim a
    documentação.
  - **Programação (23/10/2026):** todos os dias do evento nas abas (os
    que já passaram ficam acinzentados, mas clicáveis), filtros por tema,
    grupos por período e selos `ENCERRADA` (estilo de esgotada, com a
    palestra acinzentada), `EM ANDAMENTO` (estilo das vagas), `INSCRITA`,
    `ESGOTADA` e vagas, nessa ordem de prioridade. Dia ou evento sem
    palestra mostra um aviso pequeno.
  - **Agenda (23/10/2026):** linha do tempo de um dia por vez (hora,
    linha do rio com ponto e card), setas que pulam entre os dias com
    inscrição e data em destaque abaixo do título (`SÁB 24 OUT`, com o
    selo `HOJE`). Abre hoje, se tiver inscrição; senão, o próximo dia
    com inscrição; senão, o último. Cada card mostra `EVENTO · SALA ·
    ATÉ 12:30`, porque a agenda junta todos os eventos. Só no dia de
    hoje, a palestra em andamento (`AGORA · ATÉ 10:30`) ou, sem ela, a
    próxima (`PRÓXIMA · EM 30 MIN`) fica em um card maior, na cor
    principal; os outros ficam compactos. Entre palestras aparece a
    pausa ("Intervalo livre de 30 min" ou, se passa pelo meio-dia,
    "Almoço · ver onde comer", com "Em breve" até a F13). As que já
    terminaram continuam na agenda, acinzentadas (servem para avaliar e
    como histórico). O card Areia da prancha não foi usado: o canvas não
    define para que serve.
  - **Detalhes (feito em 23/10/2026):** topo Céu com o rio, selo do
    tema e título grande, e picote acima da barra de ações. Palestra em
    andamento ou encerrada: o cartão de vagas some; na barra, quem
    estava inscrito vê só favoritar (pequeno) e **Avaliar** (ou **Editar
    avaliação**), e quem não estava inscrito não vê nenhum botão; o
    lembrete some. O bloqueio no backend é da F16. O "Como chegar" e o
    "Ver planta" já vieram prontos da F04 e da F03 (Bianca), em uma
    seção na própria tela, como na prancha; o commit dos Detalhes parte
    da versão dela.
  - **Concluída (23/10/2026, branch `f20-ceu-e-eventos`):** tema céu
    suave, Avisos, Detalhes, Localização, Escolher evento, Perfil, o card
    "Próxima na agenda" e as correções do `/code-review`. A `main` com a
    F02 da Bianca foi trazida para a branch antes do Pull Request
    (conflitos em `app_shell.dart` e `palestra_details_page.dart`: a barra
    nova dos Detalhes passou a usar as funções de lembrete da F02).
    Decisões tomadas durante a execução:
    - **Avisos:** o rótulo mostra `ATUALIZADO 08:30` (hora da última
      busca) ou `SEM CONEXÃO`; o "N NOVOS" do canvas espera a F21.
    - **Detalhes:** o "Como chegar" começa recolhido e abre ao tocar.
      Numa palestra já começada, quem não estava inscrito mas favoritou
      vê a barra só com o favoritar (para poder desfavoritar). O Avaliar
      aparece na barra e na seção de avaliações.
    - **Planta:** a tela e o atalho do Início se chamam **Localização**
      (o canvas foi atualizado). Mostra o lugar, quantas salas ele tem e
      quantas palestras cada sala recebe; sala sem palestras fica sem a
      contagem.
    - **Início:** a lista "Trocar evento" virou o cartão "Você está no
      evento", que abre a tela **Escolher evento**; o card do evento
      mostra "6 palestras em 3 salas". O resto do Início não mudou.
    - **Perfil:** e-mail, número de inscrições e favoritas, **Editar
      perfil** (nome e e-mail; o resto ficou na F26), Certificados como
      "Em breve" e Sair na cor de atenção.
    - Registradas para depois: F25 (contagem de palestras e salas na
      API) e F26 (Editar perfil: e-mail repetido, senha, foto e revisão
      de segurança).
  - **Próximos passos sugeridos (não registrados como tarefa):** "Começa
    em 10 min" nos Avisos (junto da F02), "· lembrete ativo" no card
    "Próxima na agenda" (a agenda precisa trazer o lembrete), seletor de
    palestra nas Inscrições do organizador e o rio em telas largas.
- **Regra para as outras tarefas:** toda tela nova, ou tela existente
  alterada por uma tarefa, já segue o visual novo, usando o tema (nunca
  cores fixas).
- **Diferença em relação ao relatório:** o visual muda em relação ao
  protótipo do Figma entregue. Registrar o motivo em `DOCUMENTACAO.md`.

### F21 Marcar avisos como lidos (contador da barra)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Componente: barra de navegação", "Avisos (RF09, RF18, F15)".
- **Origem:** sugestão S08, aprovada em 20/10/2026 durante a F20.
- **O que já existe:** a `BarraNavegacao` (F20 parte 1) já mostra um
  contador na aba Avisos quando recebe um número maior que zero.
- **O que falta:** a tabela `notificacao` não tem um campo que diga se o
  aviso já foi lido, então hoje não há como contar os avisos novos.
  Falta o campo no banco (com script de migração, sem recriar o banco),
  uma rota para marcar como lido (por exemplo, ao abrir a aba Avisos) e
  passar a contagem para a barra no `app_shell.dart`.

### F22 Perfil de administrador geral

- **Origem:** sugestão da Manuela durante o planejamento da F08, aprovada
  em 22/10/2026.
- **O que já existe:** os organizadores são criados direto no banco
  (decisão da P01, `DOCUMENTACAO.md` seção 4), e a tabela `organizador`
  já tem o campo `nivel_acesso` (o Bruno Costa está como
  `administrador`).
- **O que falta:** um administrador (`nivel_acesso = 'administrador'`)
  promover participantes a organizadores pelo app (e tirar a permissão),
  sem precisar abrir o MySQL. A promoção precisa atualizar os dois
  registros juntos: `usuario.tipo_usuario` e a tabela `organizador`.
- **Por que ficou para depois:** nenhum dos 20 RFs pede essa função, e a
  entrega é em 23/10/2026. É uma tarefa de segurança (quem pode dar
  permissão a quem), então precisa de `/security-review` e de mais tempo.
  Entra na documentação final como "próximos passos".
- **O que o administrador já faz (F08):** vê e gerencia todos os eventos
  (painel, inscrições, evento, palestras e avaliações), com o seletor
  "Trocar evento". O que for exclusivo dele fica nesta tarefa.
- **Sugestão (22/10/2026):** uma visão consolidada só para o
  administrador, com os números de todos os eventos somados (total de
  inscrições do sistema, eventos mais procurados).

### F23 Área do palestrante

- **Origem:** pedido da Manuela durante o planejamento da F14
  (22/10/2026), para fazer se sobrar tempo.
- **O que é:** o palestrante entra no app com login próprio e vê as
  palestras em que foi indicado (e, depois, as avaliações delas).
- **Atenção:** muda duas decisões da F05: o palestrante hoje não tem
  login e o tipo `'palestrante'` saiu de `usuario`. Antes de começar,
  decidir como ligar a conta (`usuario`) ao cadastro do palestrante, que
  desde a F14 é feito por evento.
- **Depende de:** F14 e F05.

### F24 Dados de demonstração (S05)

- **Origem:** sugestão S05, aprovada em 23/10/2026 para a gravação e a
  apresentação final.
- **O que acontecia:** os dois eventos de exemplo tinham datas fixas
  que já tinham passado. O Início mostrava um evento antigo, a "próxima
  palestra" ficava vazia, e havia só 2 palestras.
- **Decidido (23/10/2026):**
  - três eventos: um encerrado, um acontecendo e um futuro;
  - datas relativas ao dia em que o script roda (`CURDATE()`), para os
    dados não envelhecerem;
  - um exemplo de cada situação que o app mostra: palestra esgotada,
    última vaga, palestra acontecendo agora, avaliações (com média de
    duas notas e uma palestra para avaliar ao vivo), palestra sem
    palestrante, evento sem patrocinadores e um aviso de cada tipo;
  - fotos, logos e planta ficam de fora (são enviados pelo app, F14).
- **Onde:** `database/sistema_eventos_atualizado.sql` (só os dados; as
  tabelas não mudaram) e o README ("Dados de demonstração (S05)", com o
  que testar com cada usuário).
- **Atenção:** a palestra "acontecendo agora" vale por 2 a 3 horas
  depois de o script rodar. Recriar o banco pouco antes da apresentação.
- **Registro:** `DOCUMENTACAO.md`, seção 9.

### F25 Total de palestras e salas na lista de eventos da API

- **Origem:** dúvida da F20 (commit Escolher evento), registrada pela
  Manuela em 23/10/2026 para fora do escopo da branch.
- **O que acontece hoje:** `GET /api/eventos` não diz quantas palestras e
  salas cada evento tem. Para mostrar "6 palestras em 3 salas" no Início
  e "N palestras" em Escolher evento, o app busca a programação inteira de
  cada evento só para contar (uma requisição por evento).
- **O que falta:** o backend devolver `total_palestras` e `total_salas`
  em cada evento (uma consulta com `COUNT`), e as duas telas usarem esses
  campos em vez de buscar a programação.
- **Por que ficou para depois:** com poucos eventos a diferença não
  aparece. Só pesa quando houver muitos eventos.
- **Painel do organizador (06/11/2026):** a Manuela pediu para mostrar lá
  o total de palestras e as palestras por sala. Isso foi para a P22, porque
  a tela já será modificada nessa tarefa.

### F26 Editar perfil: completar e revisar a segurança

- **Origem:** pedido da Manuela na F20 (23/10/2026): o link "Editar
  perfil" da prancha "Perfil — participante" entra agora, e a segurança é
  resolvida depois.
- **O que já existe (F20):** o link abaixo do e-mail no Perfil abre a tela
  `editar_perfil_page.dart`, que troca o nome e o e-mail
  (`PUT /api/usuarios/<id>`). O nome novo aparece no app inteiro na hora.
  O backend já protege a rota desde a P01: só a própria pessoa altera a
  conta (testado: outra conta → 403) e só `nome`, `email` e `senha` são
  aceitos, com as validações do cadastro.
- **O que falta:**
  - ~~**E-mail que já é de outra conta**~~ **(concluído em 04/11/2026):**
    o `AtualizarUsuarioService` confere antes de gravar, ignorando a
    própria conta, e trata o `IntegrityError`, como o
    `CriarUsuarioService`. A API responde 400 com "Já existe um usuário
    cadastrado com este email.". Testado com `curl` e MySQL: e-mail de
    outra conta e o mesmo em maiúsculas → 400; o próprio e-mail mudando só
    o nome e um e-mail livre → 200; conta de outra pessoa → 403. O caminho
    do `IntegrityError` foi testado desligando a conferência. A mensagem
    na tela ficou na seção 0.3.
  - **Trocar a senha:** a rota já aceita `senha`, mas a tela não tem o
    campo. Decidir se pede a senha atual antes (recomendado, como na
    remoção de evento).
  - **Foto de perfil (pedido da Manuela, 23/10/2026):** um campo de foto
    na tela de edição, com o `CampoImagem` (o mesmo da foto do
    palestrante), e o avatar mostrando a foto no lugar das iniciais.
    Precisa de:
    - coluna `foto` na tabela `usuario` (no SQL e com `ALTER TABLE` para
      quem já tem o banco; avisar quem precisar recriar);
    - `foto` no `to_dict` do usuário e na lista de campos aceitos pelo
      `AtualizarUsuarioService`;
    - liberar `POST /api/uploads` para qualquer pessoa logada (hoje é só
      para organizadores, P01). É uma mudança de acesso: mais gente
      enviando arquivos ao servidor, então entra no `/security-review`;
    - o login e o `AppShell` guardarem a foto, como fazem com o nome.
  - `/security-review` antes do commit.

### F27 Diagrama de classes do domínio (S13)

- **Telas no canvas:** não se aplica.
- **O que falta:** um diagrama em `docs/` com as 15 classes de
  `backend/models/`, seus atributos principais e relacionamentos,
  indicando herança, composição e agregação quando houver.
- **Rubrica:** 3 pontos (classes e atributos, relacionamentos e
  correspondência com o sistema).
- **Ao concluir:** trocar o texto do README da raiz, que diz que o
  diagrama está sendo feito, pelo link do arquivo.
- **Depende de:** F29, para o diagrama já usar os nomes novos.
- **Concluído (05/11/2026):** `docs/DIAGRAMA_CLASSES.md`, em Mermaid, com
  a herança de `db.Model` e `CRUDMixin`, as 15 classes, os atributos e os
  relacionamentos. O critério de composição e de agregação segue as
  regras de `ON DELETE` do banco. O README da raiz aponta para o arquivo.

### F28 Fluxogramas dos casos de uso (S14)

- **Telas no canvas:** não se aplica.
- **O que falta:** um fluxograma de recuperação de dados e um de entrada
  de dados, com o passo a passo pelas camadas, incluindo o Repository.
  Bons candidatos: agenda (recuperação, passa pelo `AgendaRepository`,
  que fica em `backend/repositories/palestra_repository.py`) e inscrição
  (entrada, com o controle de vagas).
- **Rubrica:** 4 pontos (2 para cada fluxograma).
- **Depende de:** F29 e P19. A rubrica exige o Repository nos dois
  fluxogramas, e a inscrição só passa por ele depois da P19.
- **Concluído (06/11/2026):** `docs/FLUXOGRAMAS.md`, em Mermaid, com a
  agenda (recuperação de dados) e a inscrição (entrada de dados). As
  caixas ficam em linha vertical, com o nome e a cor da camada, porque
  agrupadas por camada as setas se cruzavam. A consulta da agenda não
  passa por Model. O README da raiz aponta para o arquivo.

### F29 Nomes dos métodos de CRUD iguais aos dos requisitos (S15)

- **Telas no canvas:** não se aplica.
- **O que acontece hoje:** o `models/crud_mixin.py` usa `criar()`,
  `buscar_por_id()`, `listar()`, `atualizar()` e `remover()`. Os
  requisitos pedem `salvar()`, `atualizar()`, `deletar()`,
  `listar_todos()` e `buscar_por_id()`.
- **Decidido (03/11/2026):** `salvar()` continua sendo um método de
  classe que cria o registro, como o `criar()` fazia (ex.:
  `Evento.salvar(nome=...)`). Assim ele é chamado do mesmo jeito que
  `atualizar()` e `deletar()`, e a regra das vagas da Palestra fica como
  está. Repositories, Controllers, rotas, app e banco não mudam.
- **Feito em 03/11/2026 (branch `f29-nomes-crud`):** 24 arquivos
  alterados: as Models (`crud_mixin.py`, `palestra.py` e comentários de
  `evento.py` e `restaurante_evento.py`) e 20 chamadas nos Services.
- **Testado em 03/11/2026:** as 15 Models têm os nomes novos e nenhuma
  tem os antigos, e as 20 chamadas foram testadas pelas rotas da API,
  em um banco SQLite temporário: 22 de 22 verificações passaram,
  incluindo a regra das vagas da Palestra. O teste com o MySQL e no app
  está na seção 0.3.

### F30 Slides da apresentação (S16)

- **Telas no canvas:** não se aplica.
- **O que falta:** descrição, público-alvo e problema; cinco casos de
  uso com as telas; figura da arquitetura e as pastas de Controllers,
  Services, Repositories e Models; tecnologias; apresentação do README.
- **Rubrica:** ligados a 3 dos 4 pontos de "Apresentação e
  documentação".

### F31 Termos de consentimento no cadastro (S17)

- **Telas no [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt):** "Cadastro (RF01)".
- **Concluído (06/11/2026):** o cadastro tem a caixa "Li e concordo com os
  termos de uso", e o link abre o texto em uma janela. A conta só é criada
  com a caixa marcada, regra conferida também na API
  (`aceitou_termos: true`), e `usuario.data_aceite_termos` guarda a data
  do aceite. Os mesmos termos aparecem na linha "Termos de uso" da aba
  Perfil, acima de "Sair", que abre uma tela própria.
- **Texto dos termos:** o texto atual é provisório. Os termos definitivos
  entram na lista `paragrafosTermosUso` (`widgets/termos_uso.dart`).
- **Atenção:** a tabela `usuario` mudou. Depois do merge, é preciso
  recriar o banco local (passo 1.4 do `FLUXO_DE_TRABALHO.md`), senão o
  login e o cadastro dão erro.
- **Rubrica:** 1 ponto de bônus.

### F32 Vídeo de demonstração (S18)

- **Telas no canvas:** não se aplica.
- **O que falta:** gravar o sistema funcionando de ponta a ponta, com
  pelo menos quatro funcionalidades principais que não sejam CRUD, e
  conferir se elas batem com o README.
- **Atenção à duração:** os requisitos de entrega pedem no máximo 5
  minutos, e a rubrica pede no máximo 2. Até 2 minutos atende aos dois.
  Confirmar com o professor.
- **Rubrica:** 4 pontos em "Fluxo do sistema". Sem a demonstração, o
  projeto não é avaliado.
- **Quando gravar:** no último dia do cronograma (seção 0.1), com o que
  estiver pronto do bloco B. As tarefas que ficarem de fora não impedem
  a gravação.

### F33 Hospedagem do frontend e da API (S19)

- **Telas no canvas:** não se aplica.
- **O que falta:** publicar o frontend e a API, acessíveis e funcionando
  durante a avaliação. A escolha do serviço fica para o plano da tarefa.
- **Rubrica:** 2 pontos de bônus.
- **Dependia de:** P04 (concluída em 04/11/2026), porque a `SECRET_KEY`
  fixa não podia ir para um servidor público. Na hospedagem, definir no
  servidor a `SECRET_KEY` e o `CORS_ORIGENS`, sem `API_DEBUG`.
- **Tarefa de segurança:** a API passa a ficar exposta na internet.
  Fazer `/security-review` antes do commit.

## 1.3 Itens do relatório fora da lista de requisitos (decidir)

Estes itens aparecem na Seção 1 (tabela de observação), na análise das
respostas ou no diagrama do banco, mas **não** estão entre os 20
requisitos. A equipe precisa decidir se entram na entrega.

| Item | Onde aparece no relatório | O que existe hoje | Decisão |
|---|---|---|---|
| Lista de presença digital | Seção 1 e análise das respostas | Nada | Atendida pela inscrição (D01) |
| Sugestão de restaurantes próximos | Seção 1 | Tabelas `restaurante` e `restaurante_evento`, sem API nem tela | Entra como opcional para o organizador: F13 |
| Certificado (com código de validação) | Diagrama do banco | Nada | Entra: F12 (D01) |
| Tema preferido do usuário (`tema_preferido`) | Diagrama do banco | Nada | Não entra no banco (D01) |
| Recomendação de palestras | Seção 1 (atendida pela classificação por tema, RF12) | Busca por tema | Atendida pelo RF12; nada a fazer |

## 1.4 Decisões pendentes

Questões que precisam de uma decisão da equipe antes de virarem tarefa.

| ID | Decisão | Status |
|---|---|---|
| D01 | Banco atual × diagrama do relatório | Decidido (20/10/2026) |

### D01 Banco atual × diagrama do relatório

- **Contexto:** o banco atual (`database/sistema_eventos_atualizado.sql`)
  não segue exatamente o diagrama da Seção 5 do relatório. As diferenças
  tinham sido consideradas aprovadas, mas a questão foi reaberta para uma
  decisão formal.
- **Diferenças encontradas:**

| Diagrama do relatório | Banco atual |
|---|---|
| Tem `patrocinador` (nome da empresa, logo, site, descrição) | Não tem |
| Tem `avaliacao` (`nota_estrelas`, `comentario`) | Não tem; existe só `comentario.nota` |
| Tem `mensagem` (remetente, destinatário, conteúdo) | Não tem |
| Tem `certificado` (com um campo sem nome, `Atributo_1`) | Não tem |
| `usuario` tem `tema_preferido` | Não tem |
| Liga `palestra` a `localizacao` | Não liga; a sala é só texto |
| Não tem `favorito` | Tem `favorito` (criado para o RF07) |
| `palestra` sem controle de vagas | `palestra` tem `vagas_total` e `vagas_disponiveis` (RF05) |

- **Tarefas afetadas pela decisão:** F04 (rotas e localização), F07
  (avaliação), F09 (comunicados), F10 (patrocinadores) e os itens
  "certificado" e "tema preferido" da seção 1.3.
- **Por que importa:** o professor recebeu o diagrama. Se o banco entregue
  for diferente sem justificativa, isso pode ser questionado na avaliação.
- **Decisão (20/10/2026):** misto, item por item.

| Item | Decisão | Justificativa para a documentação final |
|---|---|---|
| `patrocinador` | Seguir o diagrama (criar) | Necessária para o RF19 (F10) |
| `avaliacao` | Seguir o diagrama (criar) e remover `comentario.nota` | Avaliação por estrelas do RF16 (F07), com a nota em um lugar só |
| `mensagem` | Não criar | Nenhum requisito pede troca de mensagens entre usuários. Os comunicados do RF18 usam `notificacao` (F09) |
| `certificado` | Seguir o diagrama (criar), sem `Atributo_1` | Certificado para quem participou do evento (F12) |
| `usuario.tema_preferido` | Não criar | A escolha do tema (RF20) fica salva no celular |
| `palestra` → `localizacao` | Seguir o diagrama (ligar) | Base para as rotas do RF11 (F04) |
| `favorito` | Manter o banco atual | Necessária para o RF07. Incluir no diagrama da documentação final |
| Vagas em `palestra` | Manter o banco atual | Necessárias para o RF05. Incluir no diagrama da documentação final |

- **O diagrama não muda:** ele já foi entregue e é a base da avaliação.
  As diferenças acima ficam registradas, com a justificativa de cada
  uma, na documentação final, em uma seção como "Ajustes na modelagem
  durante o desenvolvimento". Seguir o diagrama à risca não é possível:
  ele não tem `favorito` (RF07) nem os campos de vagas (RF05).
- **Restaurantes:** a tabela `restaurante` segue o diagrama e é mantida.
  Ver F13.

## 1.5 Observações

- **Banco × diagrama do relatório:** decidido na D01. O diagrama é a
  referência de modelagem para as tabelas que serão criadas
  (`patrocinador`, `avaliacao`, `certificado`).
- **Ordem de dependência:** algumas tarefas precisam de outras prontas
  antes.
  - P01 (autenticação) vem antes de F08 (organizador) e F09 (comunicados).
  - F08 vem antes de F09.
  - F05 (palestrantes) precisa ter a modelagem definida antes de
    programar, porque nem o banco nem o diagrama têm essa entidade.
  - F03 (planta baixa) e F04 (rotas) se complementam e podem ser
    pensadas juntas.
- **Protótipo no Figma:** o link do relatório não pode ser acessado pelo
  Claude Code. As telas devem ser exportadas para `arq_ref/` para servir
  de referência visual.

## 1.6 Sugestões aguardando aprovação

Ideias que **não estão no relatório**. Ficam aqui até serem aprovadas.
Uma sugestão aprovada vira uma tarefa F; uma recusada é marcada como tal.

| ID | Sugestão | Por que vale a pena | Situação |
|---|---|---|---|
| S01 | Bloquear inscrição em palestras com choque de horário | Hoje é possível se inscrever em duas palestras no mesmo horário. É uma regra simples no `CriarInscricaoService` e fácil de demonstrar | Aprovada com ajuste (avisar em vez de bloquear): virou F16 |
| S02 | Bloquear inscrição em palestra que já começou ou terminou | Mesma lógica da S01, no mesmo Service | Aprovada: virou F16 |
| S03 | Logout e login lembrado | O app não tem botão de sair e pede o login toda vez que é aberto | Aprovada: virou F17 |
| S04 | Telas para o organizador cadastrar eventos e palestras | A API já existe, mas hoje só dá para criar um evento direto no banco. Completa a área do organizador (F08) | Aprovada: virou F14 |
| S05 | Mais dados de demonstração no banco | Com só 2 palestras, a apresentação não mostra bem o controle de vagas, a busca e a agenda | Aprovada em 23/10/2026: virou F24 |
| S06 | Nova proposta visual para o app ([canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt)) | Corrige problemas do protótipo do Figma: contraste, fontes misturadas, menu duplicado, telas sem informações essenciais (vagas, botão de inscrição) e textos em inglês. Já inclui o modo escuro (RF20) | Aprovada: definida pela Manuela em outra conversa, aplicada na F20 |
| S07 | Outros tipos de atividade além de palestra (workshop, mesa-redonda), com mais de um palestrante por atividade | Amplia o uso do app para eventos variados. Fica fora desta entrega porque nenhum RF pede e o diagrama não prevê | Melhoria futura: só registrar na documentação final |
| S08 | Marcar avisos como lidos | Sem isso, o contador de avisos novos da barra de navegação (canvas) não tem o que contar | Aprovada: virou F21 |
| S09 | Deixar claro que o app tem vários eventos, cada um em um lugar: imagem de capa do evento enviada pelo organizador (no card do Início e na lista de eventos) e tela "Escolher evento" no lugar da lista "Trocar evento" (página "Proposta · eventos, lugares e salas" do [canvas](https://claude.ai/artifact/Eh68uUe4Q6xuAwYuT5UVvt)) | No teste da F03, a equipe não percebeu que "Trocar evento" leva a outro evento, em outro lugar, com outra planta. Decidido pela equipe (23/10/2026): a legibilidade do texto sobre a imagem fica a critério do organizador, e o cadastro avisa que a imagem deve ser horizontal. Precisa de `evento.imagem_capa` (o banco muda) e mexe no Início e no formulário do evento (trilha da Manuela) | Aprovada para "se sobrar tempo": item 27 da seção 0.2. A tela "Escolher evento" foi feita na F20 e falta só a imagem de capa |
| S10 | Encerrar o token também no servidor ao sair | Testado em 23/10/2026: depois do logout, o mesmo token continua funcionando por até 8 horas. Quem copiou o token ainda acessa a conta | Aprovada em 23/10/2026: entra na F17 |
| S11 | Explicar no README a rota da agenda (`/api/eventos/<id_usuario>/agenda`) | O caminho fica dentro de "eventos", mas recebe o id do usuário, o que confunde quem lê a API | Aprovada em 23/10/2026: feita na P09 (03/11/2026); trocar o caminho fica como "próximos passos" |
| S12 | Escrever o `README.md` da raiz do repositório, hoje vazio, e corrigir o nome da pasta do projeto em `sistema-eventos/README.md` (linha "a partir da raiz do repositório") e no início do `docs/FLUXO_DE_TRABALHO.md` | O README da raiz é o que o GitHub mostra na página inicial do repositório, a primeira coisa que o professor vê. Depois da troca para `laranjeira1431/fluxo` (03/11/2026), quem clona recebe a pasta `fluxo/`, e quem já tinha o projeto continua com `ProjetoDeSoftware/` | Aprovada em 03/11/2026: feita junto com a P09 (03/11/2026). O README da raiz tem a descrição, a equipe, as "Funcionalidades Implementadas" e o link para o diagrama de classes; a instalação e as rotas continuam em `sistema-eventos/README.md` |
| S13 | Diagrama de classes do domínio, em `docs/`, com o link no README da raiz | Exigido nos requisitos de entrega (`arq_ref/requisitos_entregas.pdf`) e vale 3 pontos na rubrica (`arq_ref/rubrica_projeto_de_conclusao.docx`): classes e atributos, relacionamentos (com herança, composição e agregação, quando houver) e correspondência com as 15 Models de `backend/models/`. Hoje o repositório não tem diagrama, e o README da raiz diz que ele ainda está sendo feito: ao concluir, trocar esse texto pelo link do arquivo | Aprovada em 03/11/2026: virou F27 |
| S14 | Fluxogramas dos casos de uso: um de recuperação de dados e um de entrada de dados | Valem 4 pontos na rubrica. Cada fluxograma mostra o passo a passo pelas camadas (tela, Controller, Service, Repository, Model e banco). Bons candidatos: agenda (recuperação, passa pelo `AgendaRepository`) e inscrição (entrada, com o controle de vagas) | Aprovada em 03/11/2026: virou F28 |
| S15 | Nomes dos métodos de CRUD das Models iguais aos dos requisitos | Os requisitos de entrega pedem `salvar()`, `atualizar()`, `deletar()`, `listar_todos()` e `buscar_por_id()` nas Models. O `models/crud_mixin.py` usa `criar()`, `buscar_por_id()`, `listar()`, `atualizar()` e `remover()`. O professor confere a coerência com a arquitetura da aula. Mexe em vários Services, então precisa ser uma tarefa própria, com teste de todas as telas | Aprovada em 03/11/2026: virou F29 |
| S16 | Slides da apresentação | Exigidos pela rubrica: descrição, público-alvo e problema; cinco casos de uso com as telas; figura da arquitetura e as pastas de Controllers, Services, Repositories e Models; tecnologias; apresentação do README | Aprovada em 03/11/2026: virou F30 |
| S17 | Termos de consentimento no cadastro | Bônus de 1 ponto na rubrica: mostrar os termos no cadastro (F01) e guardar no banco a decisão da pessoa (ex.: coluna com a data do aceite em `usuario`) | Aprovada em 03/11/2026: virou F31 |
| S18 | Vídeo de demonstração | A rubrica coloca a demonstração como condição para a avaliação e dá 4 pontos em "Fluxo do sistema", mas ela não tinha tarefa registrada | Aprovada em 03/11/2026: virou F32 |
| S19 | Hospedagem do frontend e da API | Bônus de 2 pontos na rubrica | Aprovada em 03/11/2026: virou F33 |
| S20 | IA como serviço em um caso de uso | Bônus de 2 pontos na rubrica | Cancelada em 06/11/2026: não será feita |
| S21 | Bloquear a palestra antes de ler a inscrição no cancelamento | Encontrada na análise da P19: dois cancelamentos simultâneos da mesma inscrição poderiam devolver a vaga duas vezes | Aprovada em 06/11/2026: virou P20 |

---

# 2. Problemas e melhorias

Lista levantada na análise completa do projeto (backend, frontend e banco)
em 19/10/2026. Cada item diz **onde** está o problema, **o que** acontece e
**por que** isso importa. As soluções ainda serão discutidas antes de
qualquer alteração.

| ID | Prioridade | Tema | Status |
|---|---|---|---|
| P01 | 🔴 | Rotas da API sem autenticação | Concluído |
| P02 | 🔴 | Login aceita senha em texto puro | Concluído |
| P03 | 🟡 | Validações que faltam nos dados recebidos | Pendente |
| P04 | 🟡 | Configuração de desenvolvimento exposta | Concluído |
| P05 | 🟢 | Abas do app recarregam a cada troca | Concluído |
| P06 | 🟡 | Fuso horário inconsistente | Pendente |
| P07 | 🟢 | Uso de método obsoleto do SQLAlchemy | Concluído |
| P08 | 🟢 | Tipo de notificação "atencao" nunca é criado | Concluído |
| P09 | 🔴 | README desatualizado | Concluído |
| P10 | 🟢 | Comentário desatualizado na tela de favoritos | Concluído |
| P11 | 🔴 **antes da P14** | Arquivos locais versionados e falta de `.gitignore` | Concluído |
| P12 | 🟢 | Projeto sem testes automatizados | Pendente |
| P13 | 🟢 | Tabelas sem uso no app | Decidido: todas terão uso (F03, F04, F08, F13) |
| P14 | 🔴 | Versão antiga e nova sem commit | Concluído |
| P15 | 🟡 | Botão de inscrição não mostra o estado da inscrição | Concluído |
| P16 | 🟡 | Fim de linha diferente entre sistemas (falta `.gitattributes`) | Concluído |
| P17 | 🟡 | Versão do Flutter não definida (`pubspec.lock` muda em cada máquina) | Concluído |
| P18 | 🟡 | Regras do Claude Code só no computador local | Concluído |
| P19 | 🔴 | Consultas da inscrição fora do Repository | Concluído |
| P20 | 🟢 | Cancelamento lê a inscrição antes do bloqueio | Pendente |
| P21 | 🟡 | Incluir o João como testador e o Mac no passo a passo | Concluído |
| P22 | 🟡 | Refatoração da tela do organizador | Pendente |

---

## Segurança e regras de negócio

### P01 🔴 Rotas da API sem autenticação

- **Onde:** todos os controllers em `backend/controllers/`, e
  `backend/controllers/auth_controller.py`.
- **O que acontece:** o login grava `id_usuario` na sessão do Flask, mas
  nenhuma rota confere essa sessão. As rotas confiam no `id_usuario`
  enviado no corpo ou na URL da requisição. Também não há diferença entre
  participante e organizador.
- **Por que importa:** qualquer pessoa com acesso à API pode se passar por
  outro usuário, inscrever ou desinscrever outras pessoas, e até criar,
  editar ou apagar eventos, palestras e usuários.
- **Concluído (21/10/2026):** autenticação por **token** assinado com o
  `itsdangerous`, que já vem com o Flask (`services/auth/token_service.py`).
  O login devolve o token, que vale 8 horas, e o app o envia no
  cabeçalho `Authorization: Bearer <token>` (`ApiService.token`). Os
  decorators `@login_obrigatorio` e `@somente_organizador`
  (`controllers/autenticacao.py`) protegem as rotas. Só login, cadastro e
  logout são públicos. O usuário vem sempre do token, e um `id_usuario`
  no corpo é ignorado. Nas rotas com `<id_usuario>` na URL, só a própria
  pessoa tem acesso. Avaliação: editar, só o autor; remover, o autor ou
  um organizador. Ninguém escolhe o próprio perfil: o cadastro cria
  sempre participante, o `PUT` ignora `tipo_usuario`, e organizadores
  são criados direto no banco. A tabela de acesso está no README
  (seção 7).
- **Para a Bianca (e para toda rota nova):** colocar `@tratar_erros` e,
  logo abaixo, `@login_obrigatorio` (ou `@somente_organizador`). Usar
  `g.usuario.id_usuario`, nunca `dados.get("id_usuario")`. A tela de
  cadastro (F01) não manda `tipo_usuario`.
- **Limitação:** o logout só apaga o token no app. Um token copiado
  antes continua valendo até vencer (mesmo se a pessoa trocar a senha),
  porque a API não guarda uma lista de tokens. Fica como próximo passo.
- **Ajustes da revisão (`/code-review`):** a atualização de usuário
  aceita só `nome`, `email` e `senha` (lista de campos permitidos) e
  recusa senha vazia; só a própria pessoa altera a conta (um organizador
  não troca a senha de outra pessoa); `TIPO_ORGANIZADOR` e
  `TIPO_PARTICIPANTE` ficam na Model `Usuario`.

### P02 🔴 Login aceita senha em texto puro

- **Onde:** `backend/services/auth/autenticar_usuario_service.py`,
  dados de exemplo no SQL e `frontend/Flutter/lib/pages/login_page.dart`.
- **O que acontece:** se a senha guardada no banco não for um hash, o
  login compara o texto diretamente. Os usuários de exemplo têm senhas
  como `hash123` salvas em texto puro. A tela de login já abre com o email
  e a senha da Ana preenchidos.
- **Por que importa:** senha nunca deve ser guardada em texto puro. Se o
  banco vazar, todas as senhas ficam expostas. Credenciais preenchidas no
  app também não são aceitáveis numa versão final.

### P03 🟡 Validações que faltam nos dados recebidos

- **Situação (05/11/2026):** o tema original, atualizações que aceitavam
  qualquer campo, está resolvido: todos os Services de atualização usam
  uma lista de campos permitidos. Por isso o título mudou (antes era
  "Atualizações aceitam qualquer campo"). Faltam quatro itens: JSON que
  não é um objeto, datas do evento, favorito repetido e planta e lembrete
  duplicados, descritos abaixo.

- **Onde:** `backend/services/usuario/atualizar_usuario_service.py`
  (e, em menor grau, os services de atualizar evento e palestra) e o
  método `atualizar` de `backend/models/crud_mixin.py`.
- **O que acontecia:** o JSON recebido era repassado inteiro para a Model.
  Isso permitia, por exemplo, mudar o `tipo_usuario` de alguém ou alterar
  `vagas_disponiveis` de uma palestra manualmente. Trocar o email por um
  que já existe gerava erro 500 em vez de uma mensagem clara (corrigido
  na F26, em 04/11/2026).
- **Já corrigido em um caso:** desde a F19, a atualização de avaliação
  aceita só `nota_estrelas` e `comentario` (não dá para trocar o autor).
- **Evento e palestra corrigidos na F08 (22/10/2026):** as duas
  atualizações aceitam só uma lista de campos permitidos. O evento não
  troca de responsável (`id_organizador`), e a palestra não aceita
  `vagas_total` nem `vagas_disponiveis` (mudar a capacidade fica para a
  F14, recalculando o saldo).
- **`tipo_usuario` corrigido na P01 (21/10/2026):** o cadastro e a
  atualização de usuário ignoram esse campo. As vagas foram
  resolvidas na F14: `vagas_disponiveis` nunca vem da requisição e é
  recalculado. O erro 500 com e-mail repetido foi corrigido na F26
  (04/11/2026).
- **Também encontrado na revisão da P01:** um corpo JSON que não é um
  objeto (ex.: `[1, 2]`) faz as rotas de inscrição, favorito, lembrete e
  avaliação responderem 500 em vez de 400.
- **Também encontrado na revisão da F29 (03/11/2026), na ordem de
  importância:**
  - **Datas do evento:** cadastrar ou editar um evento aceita `data_fim`
    antes de `data_inicio`, e uma data em outro formato (ex.:
    `10/11/2026`) devolve a mensagem do Python, em inglês. Conferir nos
    services de criar e atualizar evento e responder uma mensagem clara.
  - **Favorito repetido:** dois toques rápidos podem enviar dois pedidos
    ao mesmo tempo, e o segundo responde 500. O
    `AdicionarFavoritoService` deve tratar o `IntegrityError`, como o
    `CriarAvaliacaoService` já faz.
  - **Planta e lembrete duplicados:** dois pedidos ao mesmo tempo podem
    criar duas plantas para o mesmo evento ou dois lembretes iguais. Com
    dois lembretes, desativar apaga só um, e o lembrete continua ativo.
    A correção é uma restrição `UNIQUE` em `planta_baixa` e em
    `notificacao`, no SQL e nas Models, o que obriga a recriar o banco.
    Por isso é a última desta lista. Na `notificacao`, a restrição só
    pode valer para os lembretes, porque os avisos podem se repetir.
- **Por que importa:** o backend deve conferir o que recebe e responder
  com uma mensagem clara, em vez de erro 500 ou dados incoerentes.

### P04 🟡 Configuração de desenvolvimento exposta

- **Onde:** `backend/app.py` e `backend/config.py`.
- **O que acontece:** a API roda com `debug=True` em `0.0.0.0` (acessível
  por toda a rede), o CORS aceita qualquer origem com credenciais e a
  `SECRET_KEY` tem um valor padrão fixo no código.
- **Por que importa:** o modo debug mostra detalhes internos do servidor
  quando ocorre um erro, e a chave fixa permite falsificar a sessão.
- **Ficou mais grave com a P01 (21/10/2026):** a `SECRET_KEY` assina os
  tokens de login. Com o valor padrão do `config.py`, que está no
  repositório, qualquer pessoa consegue fabricar um token válido de
  qualquer usuário, inclusive de um organizador. Cada instalação precisa
  de uma `SECRET_KEY` própria no `.env`, e a API não deveria subir sem
  ela. O `backend/.env.example` também traz um valor de exemplo
  (`troque-esta-chave`) que não pode ser usado como chave real.
- **CORS (21/10/2026):** desde a P01 a API não usa mais cookie, então o
  `supports_credentials=True` do `app.py` ficou sem uso e pode sair.
- **Concluída em 04/11/2026:** a API não sobe sem uma `SECRET_KEY` de pelo
  menos 32 caracteres, e `API_DEBUG`, `API_HOST` e `CORS_ORIGENS` vêm do
  `.env`, com o valor mais seguro como padrão. Ver a seção 14 do
  `DOCUMENTACAO.md`.

## Bugs e inconsistências

### P05 🟢 Abas do app recarregam a cada troca

- **Onde:** `frontend/Flutter/lib/pages/app_shell.dart`.
- **O que acontece:** o comentário do `AppShell` diz que as telas mantêm
  o estado, mas `telas[aba]` recria a tela toda vez que a aba muda. A
  Agenda e os Avisos buscam os dados no `initState`, então a busca
  acontece ao entrar na aba, e não a cada redesenho da tela.
- **Por que importa:** o comentário ensina algo que o código não faz.
- **Decidido (05/11/2026, pela Manuela):** buscar os dados ao entrar na
  aba é o funcionamento desejado, porque a tela sempre abre atualizada.
  Início, Programação, Agenda e Avisos continuam assim, e a tarefa é só
  corrigir o comentário, na branch `p05-comentario-abas`.
- **Resolvido (06/11/2026):** o comentário do `AppShell` agora diz que as
  telas são montadas de novo a cada troca de aba, e por quê. O código não
  mudou.

### P06 🟡 Fuso horário inconsistente

- **Onde:** `backend/models/avaliacao.py`, `certificado.py`,
  `favorito.py` e `notificacao.py` (com `datetime.utcnow`), comparados
  com o SQL
  (`CURRENT_TIMESTAMP`).
- **O que acontece:** registros criados pela API ficam com a hora em UTC.
  Os registros criados direto no banco usam a hora local (diferença de
  3 horas no Brasil).
- **Por que importa:** ordenações e horários exibidos ficam errados.
  `datetime.utcnow` também está obsoleto no Python 3.12.
- **Contorno na F09 (23/10/2026):** a aba Avisos lê `data_envio` como
  UTC e converte para a hora do celular (`toLocal()`), então os avisos
  criados pela API aparecem na hora certa. Na S05 (23/10/2026), os
  avisos de exemplo do script SQL passaram a ser gravados em UTC
  (`UTC_TIMESTAMP()`) pelo mesmo motivo. A correção de vez continua
  sendo desta tarefa.
- **Avaliações sem contorno (encontrado em 05/11/2026):**
  `dataCurta`, em `frontend/Flutter/lib/models/avaliacao.dart`, não
  converte a hora. Pelo código, uma avaliação feita depois das 21h deve
  aparecer com a data do dia seguinte. O teste está na seção 0.3.

### P07 🟢 Uso de método obsoleto do SQLAlchemy

- **Onde:** `backend/services/participacao/cancelar_inscricao_service.py`.
- **O que acontece:** usa `Palestra.query.with_for_update().get(...)`.
  O `Query.get()` está obsoleto no SQLAlchemy 2.
- **Por que importa:** gera aviso hoje e pode parar de funcionar numa
  atualização da biblioteca.
- **Concluída (04/11/2026):** a busca passou a usar
  `with_for_update().filter_by(id_palestra=id_palestra).first()`, como já
  fazem o `CriarInscricaoService` e o `AtualizarPalestraService`. O
  bloqueio da linha continua igual. Testado com `curl` e MySQL: cancelar
  devolve a vaga, cancelar de novo responde "Inscrição não encontrada." e
  palestra já iniciada responde 400. O `LegacyAPIWarning` não aparece mais.

### P08 🟢 Tipo de notificação "atencao" nunca é criado

- **Onde:** `frontend/Flutter/lib/pages/notificacoes_page.dart` e
  `backend/services/notificacao/`.
- **O que acontece:** o app tem estilo visual para o tipo `atencao`, mas
  o backend só cria notificações do tipo `lembrete`. Também não existe
  envio real de lembrete: ativar um lembrete apenas cria um registro.
- **Por que importa:** é uma funcionalidade pela metade. Precisa ser
  implementada ou documentada como limitação.
- **Andamento (22/10/2026, F08):** o backend passou a criar avisos do
  tipo `atencao` quando o organizador remove uma inscrição. Falta o
  envio real do lembrete (F02).
- **Resolvido (02/11/2026):** as duas partes foram feitas em outras
  tarefas, sem código novo na P08:
  - **tipo `atencao`** (F08): `remover_inscricao_service.py` cria o
    aviso quando o organizador remove uma inscrição. Testado em
    02/11/2026 com `curl`: a Elisa removeu a inscrição da Ana na
    palestra 7, e a lista de avisos da Ana trouxe um aviso novo
    (`id_notificacao` 9, com a data do teste), "Sua inscrição em
    Experimentos de Química no Dia a Dia foi removida pela
    organização.", com `"tipo_notificacao": "atencao"`. O script SQL já
    traz um aviso igual (id 4, dos dados de demonstração); por isso o
    teste conferiu o id e a data, e não só o texto;
  - **envio real do lembrete** (F02): o `lembrete_service.dart` agenda
    uma notificação local, que aparece no celular cerca de 10 minutos
    antes do início, mesmo com o app fechado. Só no Android, só para
    quem ativou o lembrete e permitiu as notificações, e o Android pode
    atrasar o aviso em 1 ou 2 minutos (agendamento aproximado, para
    poupar bateria).

## Documentação e organização

### P09 🔴 README desatualizado

- **Onde:** `README.md`.
- **O que acontece:**
  - ~~manda executar `cd sistema-eventos-final`, pasta que não existe~~
    (corrigido em 20/10/2026);
  - cita `AuthService`, `EventoService` etc., mas hoje existe uma classe
    por caso de uso (ex.: `CriarInscricaoService`);
  - diz que a programação usa `/api/eventos/<id>/programacao`, mas o app
    usa `/api/palestras?id_evento=`;
  - não lista as rotas de CRUD de usuários, eventos, palestras e
    comentários;
  - não explica a rota da agenda (S11, aprovada em 23/10/2026):
    `GET /api/eventos/<id_usuario>/agenda` fica dentro de "eventos", mas
    o número na URL é o id do **usuário**, não do evento. O README deve
    deixar isso claro. Trocar o caminho da rota (por exemplo, para
    `/api/usuarios/<id_usuario>/agenda`) fica como "próximos passos",
    porque mexe no backend e no app juntos.
- **Por que importa:** o README é a primeira coisa que o professor ou
  avaliador vai ler e usar para rodar o projeto.
- **Concluído (03/11/2026), seguindo os requisitos de entrega e a rubrica
  (`arq_ref/requisitos_entregas.pdf` e
  `arq_ref/rubrica_projeto_de_conclusao.docx`), junto com a S12 e a P17:**
  - `README.md` da raiz (antes vazio): descrição, problema, público-alvo,
    equipe, a seção **"Funcionalidades Implementadas"** (31 itens, cada
    um com a tela e a rota, conferidos no código de ponta a ponta), a
    seção do diagrama de classes e o link para o README técnico. Modo
    escuro e "Sair" ficaram fora da lista porque não passam pelo banco;
  - `sistema-eventos/README.md`: a seção 1 aponta para a lista da raiz
    (para não ter duas listas diferentes); Services listados por caso de
    uso; Repositories completos; a rota da agenda explicada (S11); a
    rota `/programacao` com a observação de que o app usa
    `/api/palestras?id_evento=`; o aviso de que o script SQL apaga o
    banco e só deve rodar na instalação; o nome da pasta do projeto; e a
    observação do vídeo (até 2 minutos, pelo menos quatro
    funcionalidades que não sejam CRUD, decidido pela Manuela em
    03/11/2026, seguindo a rubrica).
  - **Falta:** o link do diagrama de classes, que depende da S13.

### P10 🟢 Comentário desatualizado na tela de favoritos

- **Onde:** `frontend/Flutter/lib/pages/favoritos_page.dart`.
- **O que acontece:** o comentário diz que os dados vêm em
  `item['palestra']`, mas a API devolve os campos sem esse aninhamento.
  O código está correto; só o comentário está errado.
- **Por que importa:** comentários errados confundem quem está aprendendo.
- **Concluída (03/11/2026):** a F20 reescreveu a tela (commit `e145869`),
  e o comentário novo já está certo: os dados da palestra vêm no mesmo
  item, lidos direto pelo `Palestra.fromJson`. Só faltava atualizar o
  status aqui. Conferido: `['palestra']` não aparece mais em `lib/`.

### P11 🔴 Arquivos locais versionados e falta de `.gitignore`

- **Onde:** `frontend/Flutter/android/local.properties`,
  `frontend/Flutter/ios/Flutter/ephemeral/`, `Generated.xcconfig`,
  `flutter_export_environment.sh`.
- **O que acontece:** são arquivos gerados automaticamente e específicos
  do computador de quem compilou (contêm caminhos locais). Não há
  `.gitignore` no projeto.
- **Por que importa:** atrapalham quem clona o projeto em outra máquina,
  e `.env`, `.venv`, `build/` etc. podem acabar no repositório por engano.
- **Feito (20/10/2026):** `.gitignore` mínimo na raiz, com `.env` (senha
  do MySQL) e `.venv/`.
- **Concluído (20/10/2026):** o commit `fc44e13` tinha levado 657
  arquivos gerados (`build/`, `.gradle/`, `.kotlin/`, `.dart_tool/`,
  `__pycache__/` e os arquivos locais do Flutter: `local.properties`,
  `ephemeral/`, `Generated.xcconfig`, `flutter_export_environment.sh`,
  `*.iml`). O `.gitignore` foi completado e eles saíram do Git com
  `git rm --cached` (continuam no computador de cada pessoa). Eles ainda
  existem no histórico, dentro do `fc44e13`; reescrever o histórico foi
  descartado por ser arriscado e sem ganho prático. Quem já tinha o
  projeto baixado segue "Atualizar a máquina depois da P11" no
  `FLUXO_DE_TRABALHO.md`.

### P12 🟢 Projeto sem testes automatizados

- **Onde:** backend e frontend.
- **O que acontece:** não existe nenhum teste. A única forma de verificar
  o sistema é testar tudo manualmente.
- **Por que importa:** a cada mudança não há como garantir que regras
  importantes (vagas, duplicidade de inscrição) continuam funcionando.

### P13 🟢 Tabelas sem uso no app

- **Onde:** `organizador`, `restaurante`, `restaurante_evento`,
  `localizacao` e `planta_baixa` (Models e SQL).
- **O que acontece:** as tabelas e as Models existem, mas não há rotas
  nem telas para elas. A rota `/api/eventos/<id>/programacao` e o CRUD
  de comentários também existem sem uso no app.
- **Por que importa:** é preciso decidir se entram no escopo da entrega
  ou se ficam documentadas como "preparadas para o futuro".
- **Situação (05/11/2026):** `organizador`, `localizacao` e `planta_baixa`
  já são usadas pelo app (F03, F04 e F08), e a rota de programação
  também. O CRUD de comentários saiu com a tabela `comentario`. Continuam
  sem uso `restaurante` e `restaurante_evento`, que aguardam a F13. A
  tarefa continua aberta.

### P14 🔴 Versão antiga e nova sem commit

- **Onde:** repositório git.
- **O que acontece:** a pasta antiga `eventos_project/` e o
  `banco_eventos.sql` aparecem como apagados, e a nova
  `sistema-eventos-refatorado/` não está no controle de versão.
- **Por que importa:** se algo der errado, não há como voltar a um ponto
  seguro da versão nova. É bom fazer esse commit antes de começar as
  correções.
- **Concluído (20/10/2026):** a versão nova entrou no commit `fc44e13`
  (branch `regras-claude`) e chegou à `main` pelo Pull Request da P11,
  já com o `.gitignore` completo.

### P15 🟡 Botão de inscrição não mostra o estado da inscrição

- **Onde:** `frontend/Flutter/lib/pages/palestra_details_page.dart` e
  `frontend/Flutter/lib/models/palestra.dart`.
- **O que acontece:** na tela de detalhes, o botão mostra
  "Inscrever-se" mesmo quando a pessoa já está inscrita, e ao tocar nele
  o texto não muda para "Cancelar inscrição". A API responde certo: o
  `GET /api/palestras/<id>` devolve `inscrito: true` para a Ana nas
  palestras 1 e 2 (testado com `curl` em 21/10/2026). A suspeita é que a
  API recuse a nova inscrição ("Usuário já está inscrito nesta
  palestra") e a tela não reflita o estado devolvido. O problema já
  existia antes da P01.
- **Por que importa:** a inscrição é uma das funções principais do app
  (RF05 e RF06) e aparece na gravação de tela.
- **Decidido (21/10/2026):** resolver junto com as tarefas de interface
  (F20 parte 2), e não na P01.
- **Concluído (22/10/2026), na F06/F07:** a causa era o
  `setState(() => futuro = carregar())` da tela de detalhes. Com a seta,
  a função devolvia o `Future` atribuído, e o Flutter lançava o erro
  "setState() callback argument returned a Future". A ação dava certo
  no backend, mas a tela não recarregava e o botão ficava com o texto
  antigo; um segundo toque recebia "Inscrição não encontrada" ou "Usuário
  já está inscrito". Corrigido com chaves no `setState` (método
  `recarregar()`), também na Programação e no "puxar para atualizar" do
  Início. Testado no app pela Bianca.

### P16 🟡 Fim de linha diferente entre sistemas (falta `.gitattributes`)

- **Onde:** raiz do repositório (o arquivo `.gitattributes` não existe).
- **O que acontece:** cada sistema operacional marca o fim de linha de
  um jeito (Windows: CRLF; Linux e macOS: LF). No Windows, o Flutter
  regera os arquivos `GeneratedPluginRegistrant` (Android e iOS) com
  outro fim de linha a cada `flutter run` ou `flutter analyze`. O
  conteúdo é o mesmo, mas o Git mostra os arquivos inteiros como
  alterados (visto na F06/F07, em 22/10/2026).
- **Por que importa:** com um `git add .`, esses arquivos entram no
  commit sem ninguém perceber, poluem o histórico e podem gerar
  conflitos entre as pessoas da equipe.
- **Proposta (aprovada em 22/10/2026):** criar `.gitattributes` na raiz
  com `* text=auto eol=lf`, para o Git guardar todos os arquivos de
  texto com LF, em qualquer sistema. Depois de criar o arquivo, rodar
  uma vez `git add --renormalize .`, que aplica a regra nova aos
  arquivos que já estão no repositório, e conferir o resultado com
  `git status` antes do commit.
- **Concluída (04/11/2026):** o `.gitattributes` foi criado na raiz com a
  regra da proposta e uma exceção: `*.bat text eol=crlf`, porque scripts
  `.bat` são do Windows e podem falhar com LF. Eram 36 arquivos em CRLF,
  todos em `frontend/Flutter/`, nenhum `.dart`. Os 36 foram guardados com
  LF, e o `gradlew.bat` volta para CRLF na pasta de trabalho. Conferido
  com `git ls-files --eol`, com `git diff --cached --ignore-space-at-eol`
  (fora o `.gitattributes`, nenhuma mudança além do fim de linha) e com
  `flutter analyze` sem erros. O teste no Windows e a compilação ficaram
  na seção 0.3.

### P17 🟡 Versão do Flutter não definida (`pubspec.lock` muda em cada máquina)

- **Onde:** `README.md` (seção "Pré-requisitos", que hoje diz só
  "Flutter 3 ou mais recente") e `frontend/Flutter/pubspec.lock`.
- **O que acontece:** o `pubspec.lock` guarda a versão exata de cada
  pacote. Com versões diferentes do Flutter, o `flutter pub get` escolhe
  versões diferentes de pacotes e reescreve o arquivo. No Flutter 3.44.1
  da Bianca, ele voltou pacotes para versões mais antigas (ex.: `clock`
  1.1.3 → 1.1.2) e removeu outros (`code_assets`, `crypto`, `hooks`),
  em 22/10/2026.
- **Por que importa:** se o arquivo entrar num commit, as versões dos
  pacotes mudam para toda a equipe sem ninguém ter decidido. O app
  também pode se comportar diferente em cada máquina.
- **Proposta (aprovada em 22/10/2026):** registrar no `README.md` a
  versão exata do Flutter que a equipe usa (conferir com
  `flutter --version`) e todas as pessoas usarem essa versão.
- **Decidido (03/11/2026):** a versão da equipe é a **3.47.7**, a da
  Manuela.
- **Concluído (03/11/2026, na branch da P09):** a versão está no
  `README.md` (Pré-requisitos) e no `FLUXO_DE_TRABALHO.md` (passo 0.3,
  com o passo a passo para trocar de versão). O `pubspec.lock` foi
  regerado na 3.47.7: quatro pacotes indiretos que vêm com o Flutter
  subiram (`matcher`, `meta`, `test_api` e `vector_math`), porque o
  arquivo anterior tinha sido gerado na F02 com outra versão.
  `flutter analyze` sem problemas. **A Bianca precisa trocar para a
  3.47.7** (passo 0.3) antes da próxima tarefa.

### P18 🟡 Regras do Claude Code só no computador local

- **Onde:** `CLAUDE.md`, `.gitignore`, `sistema-eventos/README.md`,
  `FLUXO_DE_TRABALHO.md` e este arquivo.
- **O que acontece:** o arquivo de regras do Claude Code é de uso local
  e estava versionado no repositório.
- **Decidido (05/11/2026, pela Manuela):** o arquivo sai do repositório
  e fica só no computador dela. Quem clonar o projeto não recebe o
  arquivo.
- **Concluído (05/11/2026):** o arquivo saiu do Git com
  `git rm --cached`, que para de versionar sem apagar do disco, e entrou
  no `.gitignore`. As citações que apontavam para ele no README, no
  `FLUXO_DE_TRABALHO.md` e neste arquivo foram ajustadas. As citações
  que registram decisões antigas ficaram como estavam.

### P19 🔴 Consultas da inscrição fora do Repository

- **Onde:** `backend/services/participacao/criar_inscricao_service.py` e
  `cancelar_inscricao_service.py`. Não existe um
  `ParticipacaoRepository`.
- **O que acontece:** os dois Services fazem as consultas direto, com
  `.query`, incluindo o filtro com JOIN que verifica o choque de horário.
- **Por que importa:** os requisitos de entrega pedem Repository para
  filtros específicos, e a rubrica exige o Repository nos fluxogramas
  (F28) e avalia a comunicação entre as camadas, um critério obrigatório.
  O bônus não recupera pontos perdidos nele.
- **O que fazer:** criar `backend/repositories/participacao_repository.py`
  e levar para ele as consultas desses dois Services, mantendo o bloqueio
  da linha da palestra (`with_for_update`) na mesma transação. As regras
  de negócio continuam nos Services.
- **Fora desta tarefa:** cerca de 15 outros Services ainda usam `.query`
  ou `db.session`. Ficam como "próximos passos", para não mexer em muitos
  casos de uso perto da entrega.
- **Decidido (05/11/2026, pela Manuela):** a inscrição continua como
  fluxograma de entrada de dados da F28, e a P19 vem antes dela.
- **Concluída (06/11/2026):** o `ParticipacaoRepository` tem um método por
  consulta (`buscar_palestra_com_bloqueio`, `buscar_inscricao` e
  `buscar_palestra_no_mesmo_horario`), com SQL explícito. O
  `from_statement` faz o SQL devolver objetos da Model, porque os Services
  alteram as vagas e o Controller usa o `to_dict()`. O `add`, o `delete`,
  o `commit` e o `rollback` continuam nos Services. O
  `populate_existing` garante as vagas atuais depois do bloqueio, inclusive
  na remoção pelo organizador, que carrega a palestra antes. Testado com a API e o
  MySQL, em palestras temporárias: inscrição, repetida, sem vaga, já
  iniciada, choque de horário (aviso e confirmação), palestra sem horário,
  cancelamento e remoção pelo organizador. Na disputa pela última vaga, com 4 pessoas ao mesmo
  tempo, só 1 entrou nas 5 rodadas; sem o `FOR UPDATE`, as 4 entraram.

### P20 🟢 Cancelamento lê a inscrição antes do bloqueio

- **Onde:** `backend/services/participacao/cancelar_inscricao_service.py`.
- **O que acontece:** o Service busca a inscrição antes de bloquear a
  palestra. Dois cancelamentos simultâneos da mesma inscrição poderiam
  encontrar o mesmo registro, e cada um devolveria uma vaga. O limite de
  `vagas_total` impede passar da capacidade, mas a palestra pode ficar
  com uma vaga a mais do que deveria. Encontrado na P19 e reproduzido em
  06/11/2026: com dois DELETE ao mesmo tempo, as vagas subiram 2 em vez de
  1 nas 10 rodadas do teste.
- **O que fazer:** bloquear também a inscrição (`FOR UPDATE` em
  `buscar_inscricao`, que lê a versão mais recente) ou conferir quantas
  linhas o DELETE apagou. Só trocar a ordem das buscas não resolve: a
  transação já leu o usuário no login, e o MySQL segue mostrando a foto
  dos dados daquele momento em um SELECT comum.
- **Por que não entrou na P19:** a P19 só move consultas e não muda o
  comportamento da API.

### P21 🟡 Incluir o João como testador e o Mac no passo a passo

- **Origem:** pedido da Manuela (06/11/2026), para os testes não ficarem
  todos para a véspera da gravação.
- **O que foi feito:** o João entrou no plano (seção 0.1), com um
  cronograma próprio. A seção 0.3 ganhou a forma de testar e registrar, o
  teste da P19 no app e a tabela "Erros encontrados". O
  `FLUXO_DE_TRABALHO.md` e o README passaram a cobrir o Mac.
- **Decidido (06/11/2026, pela Manuela):** a P04 fica com ela, e o João
  envia os relatos para ela, que os registra aqui. A rotina do Claude com
  o João fica no `CLAUDE.md`, que ela envia a ele e não vai para o Git.

### P22 🟡 Refatoração da tela do organizador

- **Origem:** pedido da Manuela (06/11/2026).
- **Prazo:** antes da gravação do vídeo (F32).
- **O que fazer:** mostrar no painel do organizador quantas palestras há
  em cada sala, junto com o total de palestras, que já aparece. O restante
  da refatoração será definido com a Manuela no plano da tarefa.
