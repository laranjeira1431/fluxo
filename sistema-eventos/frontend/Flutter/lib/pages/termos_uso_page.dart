import 'package:flutter/material.dart';

import '../widgets/cabecalho_tela.dart';
import '../widgets/termos_uso.dart';

/// Tela "Termos de uso" (F31), aberta pela linha de mesmo nome no Perfil.
///
/// Mostra os mesmos termos da janela do cadastro: o texto vem de
/// `widgets/termos_uso.dart`, e a tela só cuida do cabeçalho e da rolagem.
class TermosUsoPage extends StatelessWidget {
  const TermosUsoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CabecalhoTela(titulo: 'Termos de uso'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              children: const [TextoTermosUso()],
            ),
          ),
        ],
      ),
    );
  }
}
