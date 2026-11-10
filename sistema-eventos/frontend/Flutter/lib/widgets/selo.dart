import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Os quatro jeitos de um `Selo` aparecer.
///
/// - `destaque`: preenchido na cor principal (ex.: `INSCRITA`);
/// - `alerta`: contorno e texto na cor de atenção (ex.: `ESGOTADA`);
/// - `neutro`: contorno discreto (ex.: `48 VAGAS`);
/// - `organizacao`: preenchido na cor Areia, para o que vem do
///   organizador ou é só dele: os comunicados na aba Avisos (F09), o topo
///   da Área do organizador (P22) e o Início do organizador (P26)
///   (ex.: `ORGANIZAÇÃO`).
enum TipoSelo { destaque, alerta, neutro, organizacao }

/// Componente compartilhado: selo (etiqueta) de situação.
///
/// Etiqueta pequena em JetBrains Mono com a situação de uma palestra ou a
/// marca da organização. Usado na Programação, nos Detalhes, na Agenda,
/// nos Favoritos, nos Avisos, na Área do organizador e no Início do
/// organizador.
class Selo extends StatelessWidget {
  final String texto;
  final TipoSelo tipo;

  const Selo(this.texto, {super.key, this.tipo = TipoSelo.neutro});

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    // Escolhe fundo, texto e borda conforme o tipo.
    final (fundo, corTexto, borda) = switch (tipo) {
      TipoSelo.destaque => (cores.primary, cores.onPrimary, cores.primary),
      TipoSelo.alerta => (Colors.transparent, cores.error, cores.error),
      TipoSelo.neutro =>
        (Colors.transparent, cores.onSurfaceVariant, cores.outline),
      TipoSelo.organizacao => (
          cores.secondaryContainer,
          cores.onSecondaryContainer,
          cores.secondaryContainer
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: fundo,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borda),
      ),
      child: Text(
        texto.toUpperCase(),
        style: TextStyle(
          fontFamily: AppFontes.mono,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: corTexto,
        ),
      ),
    );
  }
}
