import 'package:flutter/material.dart';

import '../models/restaurante.dart';
import '../services/api_service.dart';
import '../widgets/cabecalho_tela.dart';
import '../widgets/rotulo_secao.dart';

/// Tela "Onde comer" (F13), como a prancha "Onde comer" do canvas.
///
/// Lista os restaurantes que o organizador indicou perto do evento
/// (`GET /api/restaurantes?id_evento=<id>`, `ApiService.restaurantes`),
/// do mais perto para o mais longe. Cada card mostra o nome, a nota (se
/// houver), a categoria e `800 M · RUA DAS FLORES, 100`.
///
/// Abre pelo atalho "Onde comer" do Início e pelo link "ver onde comer"
/// do almoço na Agenda. Os dois só aparecem quando o evento tem
/// restaurantes, porque a funcionalidade é opcional para o organizador.
class RestaurantesPage extends StatefulWidget {
  final int eventoId;
  final String nomeEvento;

  const RestaurantesPage({super.key, required this.eventoId, required this.nomeEvento});

  @override
  State<RestaurantesPage> createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> {
  /// A busca começa uma vez só, no `initState`, e não a cada redesenho.
  late final Future<List<dynamic>> futuro;

  @override
  void initState() {
    super.initState();
    futuro = ApiService.restaurantes(widget.eventoId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CabecalhoTela(titulo: 'Onde comer'),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: futuro,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString().replaceFirst('Exception: ', '')));
                }
                final lista = [
                  for (final item in snapshot.data ?? []) Restaurante.fromJson(Map<String, dynamic>.from(item)),
                ];
                return ListView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                  children: [
                    RotuloSecao('Indicados pela organização · ${widget.nomeEvento}'),
                    const SizedBox(height: 12),
                    // Só acontece se o organizador remover tudo enquanto a
                    // tela estava fechada: o atalho já some sem restaurantes.
                    if (lista.isEmpty)
                      Text('Este evento ainda não tem restaurantes indicados.',
                          style: Theme.of(context).textTheme.bodySmall)
                    else
                      for (var i = 0; i < lista.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        _CardRestaurante(restaurante: lista[i], posicao: i),
                      ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Card de um restaurante: ícone de talheres, nome, nota, categoria e
/// distância com endereço.
class _CardRestaurante extends StatelessWidget {
  final Restaurante restaurante;

  /// Posição na lista, usada para alternar a cor do quadro do ícone
  /// (areia e céu), como no canvas.
  final int posicao;

  const _CardRestaurante({required this.restaurante, required this.posicao});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final cores = tema.colorScheme;
    final textos = tema.textTheme;
    final r = restaurante;
    final nota = r.notaTexto;
    final endereco = r.endereco?.trim() ?? '';
    final local = endereco.isEmpty ? r.distanciaTexto : '${r.distanciaTexto} · ${endereco.toUpperCase()}';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cores.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cores.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: posicao.isEven ? cores.secondaryContainer : cores.tertiary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.restaurant, size: 26, color: cores.onSecondaryContainer),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(r.nome, style: textos.titleSmall)),
                    if (nota != null) ...[
                      const SizedBox(width: 8),
                      Semantics(
                        label: 'Nota $nota de 5',
                        child: ExcludeSemantics(
                          child: Text(
                            '★ $nota',
                            style: textos.labelMedium?.copyWith(fontWeight: FontWeight.w700, color: cores.onSurface),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (r.categoria != null && r.categoria!.trim().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(r.categoria!, style: textos.bodySmall),
                ],
                const SizedBox(height: 4),
                Text(local, style: textos.labelSmall?.copyWith(color: cores.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
