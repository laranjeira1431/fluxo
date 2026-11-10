import 'package:flutter/material.dart';

import '../models/restaurante.dart';
import '../services/api_service.dart';
import '../widgets/formulario_organizador.dart';
import '../widgets/lista_cadastro.dart';

/// Tela "Restaurantes" do organizador (F13), igual à de patrocinadores.
///
/// Lista os restaurantes do evento (`GET /api/restaurantes?id_evento=`, a
/// mesma rota da tela "Onde comer" dos participantes) e abre o formulário
/// para criar ou editar. A funcionalidade é opcional: um evento sem
/// restaurantes só não mostra o atalho "Onde comer" no app.
class OrganizadorRestaurantesPage extends StatelessWidget {
  final int eventoId;

  const OrganizadorRestaurantesPage({super.key, required this.eventoId});

  @override
  Widget build(BuildContext context) {
    return ListaCadastro(
      titulo: 'Restaurantes',
      textoAdicionar: 'Adicionar restaurante',
      textoVazio: 'Nenhum restaurante cadastrado.',
      carregar: () => ApiService.restaurantes(eventoId),
      montarItem: (r) {
        final restaurante = Restaurante.fromJson(Map<String, dynamic>.from(r));
        return ItemCadastro(
          titulo: restaurante.nome,
          detalhe: [restaurante.categoria, restaurante.distanciaTexto]
              .where((parte) => parte != null && parte.trim().isNotEmpty)
              .join(' · '),
        );
      },
      abrirFormulario: (r) => Navigator.push<bool>(
        context,
        MaterialPageRoute(
          builder: (_) => _FormularioRestaurante(eventoId: eventoId, restaurante: r),
        ),
      ),
    );
  }
}

/// Formulário "Restaurante": nome, categoria, endereço, distância (km) e
/// nota. Nome e distância são obrigatórios; a nota vai de 0 a 5.
class _FormularioRestaurante extends StatefulWidget {
  final int eventoId;
  final Map<String, dynamic>? restaurante;

  const _FormularioRestaurante({required this.eventoId, this.restaurante});

  @override
  State<_FormularioRestaurante> createState() => _FormularioRestauranteState();
}

class _FormularioRestauranteState extends State<_FormularioRestaurante> {
  late final nome = TextEditingController(text: widget.restaurante?['nome']);
  late final categoria = TextEditingController(text: widget.restaurante?['categoria']);
  late final endereco = TextEditingController(text: widget.restaurante?['endereco']);
  late final distancia = TextEditingController(text: _numeroParaTexto(widget.restaurante?['distancia'], 2));
  late final nota = TextEditingController(text: _numeroParaTexto(widget.restaurante?['avaliacao'], 1));
  bool salvando = false;

  int? get id => widget.restaurante?['id_restaurante'];

  /// Mostra o número da API com vírgula no campo (`0.8` → `0,8`).
  static String _numeroParaTexto(dynamic valor, int casas) =>
      valor is num ? numeroComVirgula(valor.toDouble(), casas) : '';

  /// Lê o que foi digitado aceitando vírgula ou ponto (`0,8` ou `0.8`).
  /// Devolve `null` se o campo estiver vazio ou não for um número. O
  /// `double.tryParse` aceita "NaN" e "Infinity", que não são distâncias
  /// nem notas (e o JSON não sabe enviar), por isso o `isFinite`.
  static double? _lerNumero(String texto) {
    final numero = double.tryParse(texto.trim().replaceAll(',', '.'));
    return numero != null && numero.isFinite ? numero : null;
  }

  void salvar() {
    if (nome.text.trim().isEmpty) {
      mostrarMensagem(context, 'Digite o nome do restaurante.');
      return;
    }
    final km = _lerNumero(distancia.text);
    if (km == null || km < 0) {
      mostrarMensagem(context, 'Informe a distância até o evento, em km (ex.: 0,8).');
      return;
    }
    final estrelas = _lerNumero(nota.text);
    if (nota.text.trim().isNotEmpty && (estrelas == null || estrelas < 0 || estrelas > 5)) {
      mostrarMensagem(context, 'A nota precisa ser um número de 0 a 5.');
      return;
    }
    executarEFechar(
      context,
      (valor) => setState(() => salvando = valor),
      () => ApiService.salvarCadastro('restaurantes', id, {
        'id_evento': widget.eventoId,
        'nome': nome.text.trim(),
        'categoria': categoria.text.trim(),
        'endereco': endereco.text.trim(),
        'distancia': km,
        // Campo vazio vira `null`: na edição, apaga a nota que existia.
        'avaliacao': estrelas,
      }),
    );
  }

  Future<void> excluir() async {
    if (!await confirmarRemocao(context, 'este restaurante')) return;
    if (!mounted) return;
    executarEFechar(
      context,
      (valor) => setState(() => salvando = valor),
      () => ApiService.removerCadastro('restaurantes', id!),
    );
  }

  @override
  Widget build(BuildContext context) {
    const tecladoNumerico = TextInputType.numberWithOptions(decimal: true);
    return FormularioOrganizador(
      titulo: 'Restaurante',
      textoBotao: 'Salvar restaurante',
      salvando: salvando,
      aoSalvar: salvar,
      aoExcluir: id == null ? null : excluir,
      campos: [
        CampoFormulario(rotulo: 'Nome', controller: nome),
        CampoFormulario(rotulo: 'Categoria', controller: categoria, dica: 'Ex.: Comida mineira'),
        CampoFormulario(rotulo: 'Endereço', controller: endereco, dica: 'Ex.: Rua das Flores, 100'),
        CampoFormulario(
          rotulo: 'Distância até o evento (km)',
          controller: distancia,
          dica: 'Ex.: 0,8',
          teclado: tecladoNumerico,
        ),
        CampoFormulario(
          rotulo: 'Nota (opcional, de 0 a 5)',
          controller: nota,
          dica: 'Ex.: 4,5',
          teclado: tecladoNumerico,
        ),
      ],
    );
  }

  @override
  void dispose() {
    nome.dispose();
    categoria.dispose();
    endereco.dispose();
    distancia.dispose();
    nota.dispose();
    super.dispose();
  }
}
