import 'package:flutter/material.dart';

/// Componente compartilhado: termos de uso do app (F31).
///
/// O texto fica neste único lugar, para a janela do cadastro e a tela
/// `TermosUsoPage`, aberta pelo Perfil, mostrarem sempre os mesmos termos.
///
/// O texto vem do Termo de Uso definitivo da equipe
/// (`docs/arq_ref/TermoDeUso_Fluxo_atualizado.pdf`), sem a data e os campos
/// de assinatura do fim: no app, quem assina é a caixa de aceite do
/// cadastro, e a data do aceite fica gravada em `usuario.data_aceite_termos`.
/// Atenção: as Cláusulas 2 e 3 têm itens que não estão no PDF (inscrições,
/// favoritos e lembretes, avisos lidos, data do aceite), aprovados pela
/// equipe em 09/11/2026. Ao copiar uma versão nova do PDF, manter esses
/// itens. Se o texto mudar, basta alterar a lista `secoesTermosUso`.

/// Uma parte dos termos: o título da cláusula (opcional) e seus parágrafos.
///
/// Os itens de lista são parágrafos que começam com "• ".
class SecaoTermos {
  final String? titulo;
  final List<String> paragrafos;

  const SecaoTermos({this.titulo, required this.paragrafos});
}

/// Linha da Encarregada de Dados (DPO), usada na Cláusula 9 e no fim dos
/// termos. Fica em um lugar só para as duas nunca ficarem diferentes.
const _linhaDpo = 'Bianca Tolentino Menezes – Encarregada de Proteção de '
    'Dados (DPO) – CPF fictício: 000.000.000-00 (sem validade).';

const secoesTermosUso = [
  SecaoTermos(
    paragrafos: [
      'Este Termo de Uso (“Termo”) é um acordo legal entre você, o(a) '
          'usuário(a) do sistema “Fluxo”, e os desenvolvedores do Projeto '
          '“Fluxo” (doravante denominado “Fluxo” ou “Nós”), um sistema pensado '
          'para apoiar participantes de palestras e eventos, ajudando-os a se '
          'localizar no espaço do evento, acompanhar a agenda e a programação, '
          'avaliar as palestras por meio de feedback e obter certificados de '
          'participação.',
      'Ao acessar ou utilizar o “Fluxo”, você manifesta sua concordância '
          'integral com este Termo de Uso, com a Política de Privacidade e com '
          'a Lei Geral de Proteção de Dados Pessoais (LGPD – Lei nº '
          '13.709/2018). Se você não concordar com estes termos, não deverá '
          'utilizar o sistema.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula primeira – Das condições gerais de uso',
    paragrafos: [
      'O “Fluxo” é destinado a oferecer aos participantes, por meio de login '
          'individual, acesso ao mapa do evento, à agenda e programação das '
          'palestras, informações sobre os palestrantes, avisos, registro de '
          'acesso (check-in), avaliação das palestras e emissão de '
          'certificados.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula segunda – Da coleta e uso de dados pessoais',
    paragrafos: [
      'O usuário declara estar ciente da coleta e uso dos seguintes dados pelo '
          '“Fluxo”, que visam exclusivamente viabilizar o funcionamento do '
          'sistema e as finalidades específicas indicadas abaixo:',
      '• Nome completo e e-mail – coletados para criar e identificar a conta '
          'de acesso ao “Fluxo” e para emissão dos certificados de '
          'participação.',
      '• Senha de acesso (armazenada de forma criptografada) – utilizada '
          'exclusivamente para autenticação no login.',
      '• Inscrições nas palestras, favoritos e lembretes – utilizados para '
          'controlar as vagas, montar a agenda personalizada e lembrar dos '
          'horários das palestras. Os organizadores de cada evento têm '
          'acesso às inscrições feitas nas próprias palestras.',
      '• Registro dos avisos já lidos – utilizado para mostrar quantos avisos '
          'novos ainda não foram vistos.',
      '• Registros de check-in / presença no evento – utilizados para '
          'confirmar a participação nas palestras e possibilitar a emissão de '
          'certificados.',
      '• Avaliações e comentários enviados na função de feedback – utilizados '
          'para medir a satisfação e a qualidade das palestras.',
      '• Data do aceite deste Termo – registrada no cadastro, para comprovar o '
          'consentimento dado.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula terceira – Finalidade da coleta',
    paragrafos: [
      'A coleta dos dados mencionados tem finalidades específicas e essenciais '
          'para a operação do “Fluxo” e a conformidade com a LGPD:',
      '• Autenticar o acesso e identificar o participante dentro do sistema.',
      '• Permitir a localização e orientação do participante no espaço físico '
          'do evento (mapa).',
      '• Disponibilizar a agenda, a programação e as informações sobre os '
          'palestrantes.',
      '• Controlar as inscrições e as vagas das palestras e enviar avisos e '
          'lembretes sobre os eventos.',
      '• Coletar feedback dos participantes para avaliação e melhoria das '
          'palestras.',
      '• Confirmar a presença do participante e possibilitar a emissão de '
          'certificados de participação.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula quarta – Vedações do uso',
    paragrafos: [
      'O usuário compromete-se a não utilizar o “Fluxo” para qualquer '
          'finalidade ilícita ou que viole este Termo de Uso, incluindo:',
      '• Carregar conteúdo ilegal, difamatório, obsceno ou prejudicial.',
      '• Acessar, alterar ou danificar contas de outros usuários.',
      '• Violar direitos de propriedade intelectual ou outros direitos de '
          'terceiros.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula quinta – Da ciência e aceite dos termos',
    paragrafos: [
      'O uso do Sistema “Fluxo” pressupõe a leitura prévia, a compreensão e a '
          'concordância com este Termo de Uso, com a Política de Privacidade e '
          'com as disposições da Lei nº 13.709/2018 (LGPD). O consentimento '
          'para o tratamento de dados pessoais é coletado de forma expressa, '
          'específica e destacada, conforme exige o art. 8º da LGPD, sendo '
          'vedada sua obtenção por aceitação genérica, tácita ou implícita. O '
          'titular que não concordar com estes termos deverá abster-se de '
          'utilizar o sistema.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula sexta – Da proteção dos dados',
    paragrafos: [
      'O “Fluxo” compromete-se a adotar medidas técnicas e administrativas em '
          'conformidade com a LGPD e normas ISO/IEC 27001, 27701 e 29100:',
      '• Criptografia dos arquivos armazenados.',
      '• Banco de dados seguro, com autenticação robusta e acesso restrito.',
      '• Políticas de segurança da informação e plano de resposta a '
          'incidentes.',
      '• Notificação ao titular e à Autoridade Nacional de Proteção de Dados '
          '(ANPD), em prazo razoável, nos casos de incidente de segurança que '
          'possa acarretar risco ou dano relevante aos titulares, nos termos do '
          'art. 48 da LGPD.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula sétima – Do compartilhamento de dados',
    paragrafos: [
      'Os dados armazenados não serão compartilhados com terceiros, exceto:',
      '• Quando autorizado expressamente pelo titular.',
      '• Mediante obrigação legal ou ordem judicial.',
      '• Para auxílio técnico restrito e necessário.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula oitava – Dos direitos do titular dos dados',
    paragrafos: [
      'Em conformidade com a LGPD, o sistema deve permitir ao usuário exercer '
          'seus direitos, incluindo:',
      '• Confirmação da existência de tratamento e acesso aos dados pessoais '
          'tratados (art. 18, I e II, da LGPD).',
      '• Correção de dados incompletos, inexatos ou desatualizados (art. 18, '
          'III, da LGPD).',
      '• Anonimização, bloqueio ou eliminação de dados pessoais '
          'desnecessários, excessivos ou tratados em desconformidade com a LGPD '
          '(art. 18, IV, da LGPD).',
      '• Portabilidade dos dados pessoais a outro fornecedor de serviço ou '
          'produto, mediante requisição expressa, observados os segredos '
          'comercial e industrial (art. 18, V, da LGPD).',
      '• Eliminação dos dados pessoais tratados com fundamento no '
          'consentimento, após sua revogação, ressalvadas as hipóteses legais '
          'de conservação (art. 18, VI, e art. 16, da LGPD).',
      '• Informação sobre as entidades públicas e privadas com as quais o '
          'controlador realizou uso compartilhado de dados (art. 18, VII, da '
          'LGPD).',
      '• Informação sobre a possibilidade de não fornecer consentimento e '
          'sobre as consequências da negativa (art. 18, VIII, da LGPD).',
      '• Revogação do consentimento a qualquer momento, mediante manifestação '
          'expressa e gratuita (art. 18, IX, e art. 8º, § 5º, da LGPD).',
      '• Exclusão da conta e dos arquivos armazenados, mediante solicitação '
          'formal (art. 18, IV, da LGPD).',
      '• Petição à Autoridade Nacional de Proteção de Dados (ANPD) em relação '
          'ao tratamento de seus dados pessoais, quando a resposta do '
          'controlador for insatisfatória (art. 18, § 1º, da LGPD).',
      'Os direitos acima poderão ser exercidos a qualquer momento, mediante '
          'requerimento expresso ao controlador, que deverá responder em prazo '
          'não superior a 15 (quinze) dias (art. 18, § 3º, da LGPD). Canal de '
          'contato do Encarregado (DPO): dpo@fluxoeventos.example (endereço '
          'ilustrativo para fins acadêmicos).',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula nona – Da identificação do responsável pelo tratamento '
        'dos dados',
    paragrafos: [
      'O Projeto “Fluxo” é responsável pelo tratamento dos dados e indica como '
          'Encarregada de Dados (DPO):',
      _linhaDpo,
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula décima – Da responsabilidade na exatidão dos dados',
    paragrafos: [
      'O usuário é responsável pela exatidão, veracidade e atualização dos '
          'dados fornecidos e documentos carregados.',
      'O “Fluxo” não se responsabiliza por inconsistências inseridas pelo '
          'usuário.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula décima primeira – Da transparência',
    paragrafos: [
      'O “Fluxo” garante a transparência sobre o tratamento dos dados '
          'pessoais.',
      'Os requerimentos dos titulares relativos aos seus dados pessoais serão '
          'atendidos em prazo não superior a 15 (quinze) dias, contados da '
          'data da solicitação, conforme art. 18, § 3º, da LGPD. Caso a '
          'resposta não seja satisfatória, o titular poderá peticionar '
          'diretamente à Autoridade Nacional de Proteção de Dados (ANPD), nos '
          'termos do art. 18, § 1º, da LGPD. O tratamento de dados pessoais '
          'deve sempre estar fundamentado em base legal adequada (art. 7º da '
          'LGPD), a qual deverá ser indicada de forma específica para cada '
          'atividade de tratamento desenvolvida pelo sistema.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula décima segunda – Do tratamento de dados de crianças e '
        'adolescentes',
    paragrafos: [
      'O “Fluxo” observa as disposições do art. 14 da LGPD, quando aplicáveis, '
          'quanto ao tratamento de dados de crianças e adolescentes, adotando '
          'os seguintes princípios:',
      '• Tratamento de dados pessoais de crianças (menores de 12 anos) somente '
          'ocorrerá mediante consentimento específico e em destaque dado por '
          'pelo menos um dos pais ou responsável legal.',
      '• Tratamento de dados pessoais de adolescentes (maiores de 12 anos e '
          'menores de 18 anos) será realizado de forma prioritária no seu '
          'melhor interesse, garantindo segurança, privacidade e respeito ao '
          'desenvolvimento.',
      '• O sistema compromete-se a manter controles técnicos e administrativos '
          'adequados, de acordo com a LGPD e com as normas ISO/IEC 27701, para '
          'assegurar a confidencialidade, integridade e uso responsável das '
          'informações de crianças e adolescentes.',
      '• Consentimento dos responsáveis poderá ser verificado por mecanismos '
          'de autenticação digital, e estes poderão revogar a autorização a '
          'qualquer momento.',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula décima terceira – Disposições gerais',
    paragrafos: [
      'O presente Termo pode ser atualizado periodicamente para refletir '
          'mudanças legais ou operacionais. Em caso de alterações relevantes '
          'que afetem direitos dos titulares, o usuário será previamente '
          'notificado por meio do próprio sistema ou pelo e-mail cadastrado, '
          'com antecedência mínima de 15 (quinze) dias antes de sua entrada em '
          'vigor, salvo quando a alteração decorrer de determinação legal ou '
          'decisão judicial que exija adoção imediata. O uso continuado do '
          'sistema após a notificação implica ciência e concordância com os '
          'termos atualizados.',
      'Este Termo é regido pela legislação brasileira e pela LGPD (Lei nº '
          '13.709/2018). Os dados pessoais serão conservados pelo prazo '
          'estritamente necessário ao cumprimento das finalidades para as quais '
          'foram coletados, nos termos do art. 15 da LGPD, e serão eliminados '
          'ao término do tratamento, salvo nas hipóteses de conservação '
          'previstas no art. 16 da mesma lei (cumprimento de obrigação legal ou '
          'regulatória, uso exclusivo do controlador com anonimização, '
          'transferência a terceiro mediante consentimento, ou uso em '
          'pesquisa).',
    ],
  ),
  SecaoTermos(
    titulo: 'Cláusula décima quarta – Do foro',
    paragrafos: [
      'Fica eleito o foro da comarca de Belo Horizonte/MG para dirimir '
          'eventuais controvérsias.',
    ],
  ),
  // O fecho do PDF: sem título, para não parecer uma 15ª cláusula.
  SecaoTermos(
    paragrafos: ['Pelo Projeto “Fluxo”: $_linhaDpo'],
  ),
];

/// As seções dos termos, uma embaixo da outra: o título de cada cláusula
/// com o estilo de título do tema e os parágrafos com o estilo de texto.
class TextoTermosUso extends StatelessWidget {
  const TextoTermosUso({super.key});

  @override
  Widget build(BuildContext context) {
    final temaTexto = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final secao in secoesTermosUso) ...[
          if (secao.titulo != null)
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 6),
              child: Text(secao.titulo!, style: temaTexto.titleSmall),
            ),
          for (final paragrafo in secao.paragrafos)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: paragrafo.startsWith('• ')
                  // Item de lista: o "•" fica numa coluna própria e o texto
                  // ao lado (Expanded), para as linhas que quebram ficarem
                  // alinhadas com o texto, e não embaixo do "•", como no PDF.
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 18,
                          child: Text('•', style: temaTexto.bodyMedium),
                        ),
                        Expanded(
                          child: Text(
                            paragrafo.substring(2),
                            style: temaTexto.bodyMedium,
                          ),
                        ),
                      ],
                    )
                  : Text(paragrafo, style: temaTexto.bodyMedium),
            ),
        ],
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
