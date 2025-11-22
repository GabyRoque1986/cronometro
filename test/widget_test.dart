import 'package:flutter_test/flutter_test.dart' show WidgetTester, expect, find, findsNothing, findsOneWidget, testWidgets;

import 'package:agoravaicronometro/main.dart';

void main() {
  testWidgets('Iniciar cronômetro e verificar atualização do tempo', (WidgetTester tester) async {
    // Constrói o app e executa um frame.
    await tester.pumpWidget(CronometroApp());

    // Verifica se o cronômetro inicia em "00:00:00".
    expect(find.text('00:00:00'), findsOneWidget);

    // Pressiona o botão "Iniciar".
    await tester.tap(find.text('Iniciar'));
    await tester.pump();

    // Espera um tempo para o cronômetro atualizar.
    await tester.pump(const Duration(seconds: 1));

    // Verifica se o tempo foi atualizado (não deve mais ser "00:00:00").
    expect(find.text('00:00:00'), findsNothing);
  });
}
