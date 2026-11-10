/// Model (do lado do Flutter): Restaurante.
///
/// Representa um restaurante perto do evento, indicado pelo organizador e
/// recebido da API Flask em `GET /api/restaurantes?id_evento=<id>` (F13,
/// tela "Onde comer").
class Restaurante {
  final int id;
  final String nome;
  final String? categoria;
  final String? endereco;

  /// Distância até o evento, em km (obrigatória no cadastro).
  final double distancia;

  /// Nota de 0 a 5 (opcional). Sem nota, o card não mostra a estrela.
  final double? nota;

  Restaurante({
    required this.id,
    required this.nome,
    this.categoria,
    this.endereco,
    required this.distancia,
    this.nota,
  });

  /// Constrói um Restaurante a partir do JSON devolvido pela API. O JSON
  /// pode trazer `1` (int) ou `1.2` (double); `num` aceita os dois.
  factory Restaurante.fromJson(Map<String, dynamic> json) {
    return Restaurante(
      id: json['id_restaurante'] as int,
      nome: json['nome'] ?? '',
      categoria: json['categoria'],
      endereco: json['endereco'],
      distancia: (json['distancia'] as num?)?.toDouble() ?? 0,
      nota: (json['avaliacao'] as num?)?.toDouble(),
    );
  }

  /// Distância como no canvas: em metros abaixo de 1 km (`800 M`) e em km
  /// a partir dele (`1,2 KM`).
  String get distanciaTexto {
    if (distancia < 1) return '${(distancia * 1000).round()} M';
    return '${numeroComVirgula(distancia, 1)} KM';
  }

  /// Nota com vírgula e sempre uma casa (`4,5`, `4,0`), como as médias
  /// das avaliações; `null` sem nota.
  String? get notaTexto => nota?.toStringAsFixed(1).replaceAll('.', ',');
}

/// Número com vírgula decimal e sem zeros sobrando no fim
/// (`1.20` → `1,2`; `2.0` → `2`). Usado no card e no formulário do
/// organizador.
String numeroComVirgula(double valor, int casas) {
  var texto = valor.toStringAsFixed(casas);
  if (texto.contains('.')) texto = texto.replaceFirst(RegExp(r'\.?0+$'), '');
  return texto.replaceAll('.', ',');
}
