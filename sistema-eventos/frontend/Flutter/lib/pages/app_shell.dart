import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../services/lembrete_service.dart';
import '../widgets/barra_navegacao.dart';
import 'agenda_page.dart';
import 'home_page.dart';
import 'notificacoes_page.dart';
import 'perfil_page.dart';
import 'programacao_aba_page.dart';

/// Casca (shell) do app após o login: contém a barra de navegação inferior
/// e alterna entre as cinco telas principais — Início, Programação,
/// Agenda, Avisos e Perfil. As telas não ficam guardadas: `telas[aba]`
/// monta a tela de novo a cada troca de aba, e o estado dela se perde. É de
/// propósito: como cada tela busca os dados no `initState`, ela sempre abre
/// atualizada. O que precisa sobreviver à troca (aba atual, evento
/// escolhido, nome e e-mail) fica aqui no `AppShell`. Os Favoritos saíram
/// da barra na F20 e agora são abertos pelo Perfil, como no canvas.
///
/// Recebe `usuarioId`/`nomeUsuario`/`ehOrganizador` uma única vez (vindos
/// do login) e os repassa para cada tela filha, evitando que cada tela
/// precise refazer a autenticação ou buscar esses dados de novo.
class AppShell extends StatefulWidget {
  final int usuarioId;
  final String nomeUsuario;

  /// E-mail da conta, mostrado no Perfil. Vem do login, como o nome.
  final String emailUsuario;

  /// Se a pessoa logada é organizadora (`tipo_usuario` do login). Só
  /// decide o que aparece na tela: quem protege as rotas é o backend.
  final bool ehOrganizador;

  const AppShell({
    super.key,
    required this.usuarioId,
    required this.nomeUsuario,
    required this.emailUsuario,
    required this.ehOrganizador,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int aba = 0;

  /// Avisos que a pessoa ainda não viu, mostrados no contador da barra (F21).
  int avisosNovos = 0;

  /// Evento escolhido no Início (tela Escolher evento), usado também pela aba
  /// Programação. Fica aqui porque as telas são montadas de novo a cada
  /// troca de aba.
  int? eventoInicio;

  /// Nome e e-mail mostrados no app. Começam com os do login e mudam
  /// quando a pessoa salva em "Editar perfil", sem precisar entrar de novo.
  late String nome = widget.nomeUsuario;
  late String email = widget.emailUsuario;

  /// Logo depois do login, refaz os avisos de início das palestras no
  /// celular a partir dos lembretes ativos (F02) e busca o contador de
  /// avisos novos (F21).
  @override
  void initState() {
    super.initState();
    LembreteService.sincronizar(widget.usuarioId);
    atualizarAvisosNovos();
  }

  /// Conta os avisos não lidos a partir da lista que a API já entrega, sem
  /// precisar de uma rota só para isso. Se a busca falhar, o contador fica
  /// como está: um número desatualizado não pode atrapalhar o uso do app.
  /// Na aba Avisos, a resposta é ignorada, porque ela pode ter saído antes
  /// de a tela marcar os avisos como lidos e traria o número antigo de volta.
  Future<void> atualizarAvisosNovos() async {
    try {
      final avisos = await ApiService.notificacoes(widget.usuarioId);
      if (!mounted || aba == BarraNavegacao.abaAvisos) return;
      setState(() {
        avisosNovos = avisos.where((aviso) => aviso['lida'] == false).length;
      });
    } catch (_) {
      // Sem conexão: tenta de novo na próxima troca de aba.
    }
  }

  /// Troca a aba e atualiza o contador. Na aba Avisos não precisa contar:
  /// a própria tela marca os avisos como lidos e chama `aoLerAvisos`.
  void trocarAba(int indice) {
    if (indice == aba) return;
    setState(() => aba = indice);
    if (indice != BarraNavegacao.abaAvisos) atualizarAvisosNovos();
  }

  @override
  Widget build(BuildContext context) {
    final telas = [
      HomePage(
        usuarioId: widget.usuarioId,
        nomeUsuario: nome,
        // "Ver agenda" do Início troca para a aba Agenda (índice 2).
        aoVerAgenda: () => trocarAba(2),
        eventoId: eventoInicio,
        aoTrocarEvento: (id) => setState(() => eventoInicio = id),
      ),
      ProgramacaoAbaPage(usuarioId: widget.usuarioId, eventoId: eventoInicio),
      AgendaPage(usuarioId: widget.usuarioId),
      NotificacoesPage(
        usuarioId: widget.usuarioId,
        aoLerAvisos: () {
          if (mounted) setState(() => avisosNovos = 0);
        },
      ),
      PerfilPage(
        usuarioId: widget.usuarioId,
        nomeUsuario: nome,
        emailUsuario: email,
        ehOrganizador: widget.ehOrganizador,
        aoEditarPerfil: (novoNome, novoEmail) => setState(() {
          nome = novoNome;
          email = novoEmail;
        }),
      ),
    ];
    return Scaffold(
      body: telas[aba],
      // O visual da barra fica no componente compartilhado
      // `widgets/barra_navegacao.dart`; aqui só se decide a tela.
      bottomNavigationBar: BarraNavegacao(
        abaAtual: aba,
        aoTrocarAba: trocarAba,
        avisosNovos: avisosNovos,
      ),
    );
  }
}
