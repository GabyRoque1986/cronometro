import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/stopwatch_viewmodel.dart';
import 'view/stopwatch_page.dart';

//nao é o oficial

void main() {
  runApp(CronometroApp());
}

class CronometroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StopwatchViewModel()),
      ],
      child: MaterialApp(
        title: 'Cronômetro de Voltas',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StopwatchPage(),
      ),
    ); // 👈 Certifique-se de fechar todos os parênteses aqui!
  }
}
