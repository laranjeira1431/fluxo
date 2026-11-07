import 'package:flutter/material.dart';

/// Componente compartilhado: termos de uso do app (F31).
///
/// O texto fica neste único lugar, para a janela do cadastro e a tela
/// `TermosUsoPage`, aberta pelo Perfil, mostrarem sempre os mesmos termos.
/// Para trocar o texto, basta alterar a lista `paragrafosTermosUso`.
const paragrafosTermosUso = [
  'Para usar o Fluxo Eventos, guardamos seu nome, seu e-mail e sua senha '
      'protegida. Também guardamos suas inscrições, favoritos, lembretes e '
      'avaliações.',
  'Usamos esses dados para criar sua conta, montar sua agenda e enviar '
      'avisos sobre os eventos. Os organizadores veem as inscrições nos '
      'próprios eventos, e suas avaliações podem aparecer para outras '
      'pessoas no aplicativo.',
  'Não vendemos seus dados. Ao marcar a opção no cadastro, você concorda '
      'com esse uso, e a data do aceite fica registrada.',
];

/// Os parágrafos dos termos, um embaixo do outro.
class TextoTermosUso extends StatelessWidget {
  const TextoTermosUso({super.key});

  @override
  Widget build(BuildContext context) {
    final estilo = Theme.of(context).textTheme.bodyMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final paragrafo in paragrafosTermosUso)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(paragrafo, style: estilo),
          ),
      ],
    );
  }
}

/// Abre os termos em uma janela que sobe de baixo da tela
/// (`showModalBottomSheet`), como o aviso de choque de horário.
Future<void> mostrarTermosUso(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    // Deixa a janela passar da metade da tela; com o conteúdo rolável
    // (abaixo), um texto longo cabe também em telas baixas.
    isScrollControlled: true,
    showDragHandle: true,
    builder: (contextoJanela) => SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Termos de uso', style: Theme.of(contextoJanela).textTheme.headlineSmall),
            const SizedBox(height: 12),
            const TextoTermosUso(),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => Navigator.pop(contextoJanela),
              child: const Text('Fechar'),
            ),
          ],
        ),
      ),
    ),
  );
}
