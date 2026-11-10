import 'package:flutter/material.dart';

import '../models/palestra.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';
import '../widgets/cabecalho_tela.dart';
import '../widgets/rotulo_secao.dart';
import '../widgets/selo.dart';
import 'organizador_comunicado_page.dart';
import 'organizador_evento_page.dart';
import 'organizador_inscricoes_page.dart';
import 'organizador_locais_page.dart';
import 'organizador_palestrantes_page.dart';
import 'organizador_palestras_page.dart';
import 'organizador_patrocinadores_page.dart';

/// Tela "Área do organizador" (F08, RF17): o painel do evento.
///
/// Aberta pelo Perfil, só para organizadores. O layout foi refeito na P22
/// (09/11/2026) para ficar diferente das telas do participante e mais
/// fácil de ler. De cima para baixo:
///
/// - o selo `ORGANIZAÇÃO` (Areia), que mostra que esta é a área de quem
///   organiza, e o seletor "Trocar evento" (só com mais de um evento);
/// - os números do evento em cartões com ícone (palestras, inscrições,
///   esgotadas e média das avaliações) e um cartão largo com a ocupação
///   das vagas e uma barra de progresso;
/// - as ações da área em botões com ícone, dois por linha: "Inscrições" e
///   "Comunicado" (F09) em Participantes, e os cadastros do evento (F14);
/// - quantas palestras há em cada sala (P22);
/// - as 5 palestras mais procuradas. Tocar numa palestra abre as
///   inscrições dela, onde estão todas as palestras.
///
/// "Novo evento" (e, para quem ainda não tem evento, "Criar meu primeiro
/// evento") abre o formulário do evento (F14). Ao voltar, o painel busca
/// de novo a lista de eventos e mostra o evento criado.
///
/// Mostra só os eventos que a pessoa gerencia (`GET /api/organizador/eventos`):
/// os ligados a ela, ou todos, para o administrador. Começa pelo primeiro;
/// com mais de um, aparece um seletor no topo para trocar de evento (o
/// "trocar evento" do canvas). Os números vêm de
/// `GET /api/organizador/eventos/<id>/painel` (`ApiService.painelOrganizador`).
class OrganizadorPainelPage extends StatefulWidget {
  const OrganizadorPainelPage({super.key});

  @override
  State<OrganizadorPainelPage> createState() => _OrganizadorPainelPageState();
}

class _OrganizadorPainelPageState extends State<OrganizadorPainelPage> {
  late Future<Map<String, dynamic>?> futuro;

  /// Eventos da pessoa e o escolhido, guardados depois da primeira busca:
  /// ao recarregar ou trocar de evento, o app pede só o painel.
  List<dynamic>? meusEventos;
  int? eventoId;

  /// Quantas palestras aparecem no ranking. A lista completa fica na tela
  /// de Inscrições.
  static const tamanhoRanking = 5;

  @override
  void initState() {
    super.initState();
    futuro = carregar();
  }

  /// Busca os eventos da pessoa (só na primeira vez) e o painel do evento
  /// escolhido. Devolve `null` se ela ainda não tiver nenhum evento.
  Future<Map<String, dynamic>?> carregar() async {
    if (meusEventos == null) {
      final eventos = await ApiService.meusEventos();
      meusEventos = eventos;
      // Mantém o evento escolhido (ex.: o que acabou de ser criado), a não
      // ser que ele não exista mais (ex.: acabou de ser excluído).
      final aindaExiste = eventos.any((e) => e['id_evento'] == eventoId);
      if (!aindaExiste) {
        eventoId = eventos.isEmpty ? null : eventos.first['id_evento'];
      }
    }
    if (eventoId == null) return null;
    return ApiService.painelOrganizador(eventoId!);
  }

  void trocarEvento(int? id) {
    if (id == null || id == eventoId) return;
    eventoId = id;
    recarregar();
  }

  /// Recarrega o painel (puxar a tela para baixo, trocar de evento ou
  /// voltar das inscrições, que podem ter mudado os números).
  ///
  /// O `setState` usa chaves: com a seta, a função devolveria o `Future`
  /// e o Flutter daria o erro "setState() callback argument returned a
  /// Future" sem redesenhar a tela (o título não mudava ao trocar de
  /// evento).
  Future<void> recarregar() async {
    setState(() {
      futuro = carregar();
    });
    await futuro;
  }

  Future<void> abrirInscricoes(List<dynamic> palestras, int palestraId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OrganizadorInscricoesPage(
          palestras: palestras,
          palestraInicialId: palestraId,
        ),
      ),
    );
    if (mounted) recarregar();
  }

  /// Abre o formulário do evento: sem `evento`, para criar um novo; com
  /// ele, para editar. Se algo mudou, busca de novo a lista de eventos
  /// (o nome pode ter mudado, ou o evento pode ter sido criado ou
  /// excluído).
  Future<void> abrirEvento({Map<String, dynamic>? evento}) async {
    final resultado = await Navigator.push<ResultadoEvento>(
      context,
      MaterialPageRoute(builder: (_) => OrganizadorEventoPage(evento: evento)),
    );
    if (resultado == null || !mounted) return;
    meusEventos = null;
    if (resultado == ResultadoEvento.removido) eventoId = null;
    recarregar();
  }

  /// Abre a lista de um cadastro do evento (locais, palestras etc.) e
  /// recarrega o painel ao voltar, porque os números podem ter mudado.
  Future<void> abrirCadastro(Widget tela) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => tela));
    if (mounted) recarregar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>?>(
        future: futuro,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              children: [
                CabecalhoTela(titulo: 'Área do organizador'),
                Expanded(child: Center(child: CircularProgressIndicator())),
              ],
            );
          }
          if (snapshot.hasError || snapshot.data == null) {
            return Column(
              children: [
                const CabecalhoTela(titulo: 'Área do organizador'),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          snapshot.hasError
                              ? snapshot.error
                                  .toString()
                                  .replaceFirst('Exception: ', '')
                              : 'Você ainda não tem eventos.',
                        ),
                        // Sem isso, depois de um erro (ex.: a rede caiu)
                        // a única saída seria fechar e abrir a área de novo.
                        if (snapshot.hasError)
                          TextButton(
                            onPressed: recarregar,
                            child: const Text('Tentar de novo'),
                          )
                        else ...[
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: () => abrirEvento(),
                            child: const Text('Criar meu primeiro evento'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          final painel = snapshot.data!;
          final evento = Map<String, dynamic>.from(painel['evento']);
          final resumo = Map<String, dynamic>.from(painel['resumo']);
          final palestras = List<dynamic>.from(painel['palestras']);

          return Column(
            children: [
              CabecalhoTela(
                  titulo: evento['nome'] ?? '', secao: 'Área do organizador'),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: recarregar,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                    children: [
                      // O selo Areia diferencia esta área das telas do
                      // participante, que não têm nenhum selo no topo.
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Selo('Organização', tipo: TipoSelo.organizacao),
                      ),
                      const SizedBox(height: 12),
                      if ((meusEventos?.length ?? 0) > 1) ...[
                        DropdownButtonFormField<int>(
                          initialValue: eventoId,
                          isExpanded: true,
                          decoration:
                              const InputDecoration(labelText: 'Trocar evento'),
                          items: [
                            for (final e in meusEventos!)
                              DropdownMenuItem(
                                value: e['id_evento'] as int,
                                child: Text(e['nome'] ?? '',
                                    overflow: TextOverflow.ellipsis),
                              ),
                          ],
                          onChanged: trocarEvento,
                        ),
                        const SizedBox(height: 16),
                      ],
                      _CartoesNumeros(resumo: resumo),
                      const SizedBox(height: 24),
                      const RotuloSecao('Participantes'),
                      const SizedBox(height: 8),
                      ..._emPares([
                        _BotaoAcao(
                          icone: Icons.people_outline,
                          nome: 'Inscrições',
                          motivoDesativado: 'Cadastre uma palestra antes',
                          aoTocar: palestras.isEmpty
                              ? null
                              : () => abrirInscricoes(
                                  palestras, palestras.first['id_palestra']),
                        ),
                        _BotaoAcao(
                          icone: Icons.campaign_outlined,
                          nome: 'Comunicado',
                          aoTocar: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OrganizadorComunicadoPage(
                                  eventoId: eventoId!, palestras: palestras),
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 16),
                      const RotuloSecao('Cadastros do evento'),
                      const SizedBox(height: 8),
                      // Locais e palestrantes vêm antes das palestras: a
                      // palestra escolhe um local e um palestrante já
                      // cadastrados.
                      ..._emPares([
                        _BotaoAcao(
                          icone: Icons.map_outlined,
                          nome: 'Evento e planta',
                          aoTocar: () => abrirEvento(evento: evento),
                        ),
                        _BotaoAcao(
                          icone: Icons.meeting_room_outlined,
                          nome: 'Locais e rotas',
                          aoTocar: () => abrirCadastro(
                              OrganizadorLocaisPage(eventoId: eventoId!)),
                        ),
                        _BotaoAcao(
                          icone: Icons.record_voice_over_outlined,
                          nome: 'Palestrantes',
                          aoTocar: () => abrirCadastro(
                              OrganizadorPalestrantesPage(eventoId: eventoId!)),
                        ),
                        _BotaoAcao(
                          icone: Icons.event_note_outlined,
                          nome: 'Palestras',
                          aoTocar: () => abrirCadastro(
                              OrganizadorPalestrasPage(eventoId: eventoId!)),
                        ),
                        _BotaoAcao(
                          icone: Icons.handshake_outlined,
                          nome: 'Patrocinadores',
                          aoTocar: () => abrirCadastro(
                              OrganizadorPatrocinadoresPage(
                                  eventoId: eventoId!)),
                        ),
                        _BotaoAcao(
                          icone: Icons.add,
                          nome: 'Novo evento',
                          aoTocar: () => abrirEvento(),
                        ),
                      ]),
                      const SizedBox(height: 24),
                      // Sem palestras, as duas seções abaixo ficariam
                      // vazias: no lugar delas, aparece uma frase só.
                      if (palestras.isEmpty) ...[
                        const RotuloSecao('Palestras'),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text('Nenhuma palestra cadastrada.'),
                        ),
                      ] else ...[
                        const RotuloSecao('Palestras por sala'),
                        const SizedBox(height: 4),
                        _PalestrasPorSala(palestras: palestras),
                        const SizedBox(height: 24),
                        const RotuloSecao('Palestras mais procuradas'),
                        const SizedBox(height: 4),
                        // O backend já devolve as palestras da mais
                        // procurada para a menos procurada; aqui só
                        // cortamos as 5 primeiras.
                        for (final json in palestras.take(tamanhoRanking))
                          _ItemRanking(
                            dados: Map<String, dynamic>.from(json),
                            aoTocar: () =>
                                abrirInscricoes(palestras, json['id_palestra']),
                          ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Organiza uma lista de cartões em linhas de dois, com espaço entre eles.
///
/// Cada linha é uma `Row` com dois `Expanded` (cada cartão ocupa metade da
/// largura). O `IntrinsicHeight` mede o cartão mais alto da linha e deixa
/// o outro com a mesma altura (ex.: quando um nome quebra em duas linhas).
/// Se a quantidade for ímpar, o último cartão fica sozinho na metade da
/// esquerda.
///
/// Usamos `Row` em vez de `GridView` porque o `GridView` dentro de uma
/// `ListView` precisa de configuração extra (`shrinkWrap` e `physics`) e
/// exige uma altura fixa para os cartões.
List<Widget> _emPares(List<Widget> cartoes) {
  const espaco = 10.0;
  return [
    for (var i = 0; i < cartoes.length; i += 2)
      Padding(
        padding: const EdgeInsets.only(bottom: espaco),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: cartoes[i]),
              const SizedBox(width: espaco),
              Expanded(
                child: i + 1 < cartoes.length
                    ? cartoes[i + 1]
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
  ];
}

/// Decoração dos cartões do painel: fundo de card, linha de 1px e cantos
/// de 12px, como no resto do app.
BoxDecoration _decoracaoCartao(ColorScheme cores) => BoxDecoration(
      color: cores.surface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: cores.outlineVariant),
    );

/// Estilo do número grande dos cartões (JetBrains Mono, como os outros
/// números do app). Fica numa função só para os cartões não ficarem
/// diferentes entre si.
TextStyle _estiloNumero(ColorScheme cores) => TextStyle(
      fontFamily: AppFontes.mono,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: cores.primary,
    );

/// Os números do evento: quatro cartões com ícone, dois por linha, e um
/// cartão largo com a ocupação das vagas.
class _CartoesNumeros extends StatelessWidget {
  final Map<String, dynamic> resumo;

  const _CartoesNumeros({required this.resumo});

  @override
  Widget build(BuildContext context) {
    final media = resumo['media_avaliacoes'];
    final totalAvaliacoes = resumo['total_avaliacoes'] ?? 0;

    return Column(
      children: [
        ..._emPares([
          _CartaoNumero(
            icone: Icons.mic_none,
            valor: '${resumo['total_palestras']}',
            rotulo: 'palestras',
          ),
          _CartaoNumero(
            icone: Icons.people_outline,
            valor: '${resumo['total_inscricoes']}',
            rotulo: 'inscrições',
          ),
          _CartaoNumero(
            icone: Icons.event_busy_outlined,
            valor: '${resumo['palestras_esgotadas']}',
            rotulo: 'esgotadas',
          ),
          _CartaoNumero(
            icone: Icons.star_outline,
            // Sem nenhuma avaliação, mostra um traço em vez de "0,0".
            valor: media == null ? '—' : _decimal(media),
            rotulo: totalAvaliacoes == 1
                ? '1 avaliação'
                : '$totalAvaliacoes avaliações',
          ),
        ]),
        _CartaoOcupacao(percentual: resumo['ocupacao_percentual'] ?? 0),
      ],
    );
  }
}

/// Um número do painel: o ícone e o valor na mesma linha, e o rótulo
/// embaixo.
class _CartaoNumero extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String rotulo;

  const _CartaoNumero({
    required this.icone,
    required this.valor,
    required this.rotulo,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final cores = tema.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _decoracaoCartao(cores),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icone, size: 20, color: cores.secondary),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  valor,
                  overflow: TextOverflow.ellipsis,
                  style: _estiloNumero(cores),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(rotulo, style: tema.textTheme.bodySmall),
        ],
      ),
    );
  }
}

/// Cartão largo com a porcentagem das vagas ocupadas e uma barra de
/// progresso.
///
/// A barra é o `LinearProgressIndicator`, um widget do Flutter que
/// preenche a barra conforme o `value`, de 0.0 (vazia) a 1.0 (cheia). Por
/// isso a porcentagem (0 a 100) é dividida por 100.
class _CartaoOcupacao extends StatelessWidget {
  final num percentual;

  const _CartaoOcupacao({required this.percentual});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final cores = tema.colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _decoracaoCartao(cores),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.pie_chart_outline, size: 20, color: cores.secondary),
              const SizedBox(width: 8),
              Text('$percentual%', style: _estiloNumero(cores)),
              const SizedBox(width: 8),
              Expanded(
                child:
                    Text('das vagas ocupadas', style: tema.textTheme.bodySmall),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // O `ClipRRect` arredonda as pontas da barra. Cantos e cores
          // iguais aos da barra de vagas dos Detalhes da palestra.
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: (percentual / 100).clamp(0.0, 1.0).toDouble(),
              minHeight: 6,
              color: cores.primary,
              backgroundColor: cores.secondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

/// Um botão de ação da área: o ícone em cima e o nome embaixo. Sem
/// `aoTocar`, aparece apagado, não responde ao toque e mostra o
/// `motivoDesativado` embaixo do nome (ex.: "Inscrições" quando o evento
/// ainda não tem palestras).
class _BotaoAcao extends StatelessWidget {
  final IconData icone;
  final String nome;
  final String? motivoDesativado;
  final VoidCallback? aoTocar;

  const _BotaoAcao({
    required this.icone,
    required this.nome,
    this.motivoDesativado,
    this.aoTocar,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final cores = tema.colorScheme;
    final ativo = aoTocar != null;

    // O `Semantics` avisa os leitores de tela (TalkBack, VoiceOver) que
    // isto é um botão e se ele está ativo; só a opacidade não diz isso.
    // O `Material` dá a superfície onde o `InkWell` desenha o efeito do
    // toque; sem ele, o efeito ficaria escondido atrás do fundo do cartão.
    return Semantics(
      button: true,
      enabled: ativo,
      child: Opacity(
        opacity: ativo ? 1 : 0.5,
        child: Material(
          color: cores.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: cores.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: aoTocar,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icone, size: 24, color: cores.secondary),
                  const SizedBox(height: 10),
                  Text(nome, style: tema.textTheme.titleSmall),
                  if (!ativo && motivoDesativado != null)
                    Text(motivoDesativado!, style: tema.textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Quantas palestras há em cada sala (P22), da sala com mais palestras
/// para a com menos.
///
/// A conta é feita aqui, com a lista de palestras que o painel já recebe
/// (cada palestra traz a sua `sala`), sem precisar de outra requisição.
/// Por isso só aparecem as salas que têm pelo menos uma palestra.
/// Palestras sem sala entram como "Local a definir".
class _PalestrasPorSala extends StatelessWidget {
  final List<dynamic> palestras;

  const _PalestrasPorSala({required this.palestras});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    // Um `Map` guarda a contagem: a chave é o nome da sala e o valor, o
    // número de palestras nela.
    final contagem = <String, int>{};
    for (final json in palestras) {
      final sala = (json['sala'] as String?) ?? 'Local a definir';
      contagem[sala] = (contagem[sala] ?? 0) + 1;
    }
    // Ordena pela quantidade (maior primeiro); no empate, pelo nome, para
    // a ordem não mudar quando mudam as inscrições.
    final salas = contagem.entries.toList()
      ..sort((a, b) => a.value != b.value
          ? b.value.compareTo(a.value)
          : a.key.compareTo(b.key));

    return Column(
      children: [
        for (final sala in salas)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: tema.colorScheme.outlineVariant)),
            ),
            child: Row(
              children: [
                Icon(Icons.meeting_room_outlined,
                    size: 18, color: tema.colorScheme.secondary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(sala.key.toUpperCase(),
                      style: tema.textTheme.labelMedium),
                ),
                Text(
                  sala.value == 1 ? '1 palestra' : '${sala.value} palestras',
                  style: tema.textTheme.bodySmall,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Uma palestra do ranking: título, horário e sala, inscritos/vagas e a
/// média das avaliações. Mostra o selo "Esgotada" quando não há vagas.
class _ItemRanking extends StatelessWidget {
  final Map<String, dynamic> dados;
  final VoidCallback aoTocar;

  const _ItemRanking({required this.dados, required this.aoTocar});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final palestra = Palestra.fromJson(dados);
    final media = dados['media_avaliacoes'];
    final detalhes = [
      '${dados['total_inscritos']}/${palestra.total} inscritos',
      if (media != null) '★ ${_decimal(media)}',
    ].join(' · ');

    return InkWell(
      onTap: aoTocar,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: tema.colorScheme.outlineVariant)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${palestra.horario} · ${palestra.sala ?? 'Local a definir'}'
                        .toUpperCase(),
                    style: tema.textTheme.labelMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(palestra.titulo, style: tema.textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(detalhes, style: tema.textTheme.bodySmall),
                ],
              ),
            ),
            if (palestra.vagas == 0) ...[
              const SizedBox(width: 8),
              const Selo('Esgotada', tipo: TipoSelo.alerta),
            ],
            Icon(Icons.chevron_right, color: tema.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}

/// Número com uma casa decimal e vírgula, como se escreve no Brasil
/// (4.5 → "4,5").
String _decimal(num valor) => valor.toStringAsFixed(1).replaceAll('.', ',');
