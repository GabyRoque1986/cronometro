import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/stopwatch_viewmodel.dart';  // Importação correta
import 'view/stopwatch_page.dart';           // Importação correta

void main() {
  runApp(CronometroApp());
}

class CronometroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StopwatchViewModel()), // Fornecendo o ViewModel
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cronômetro de Voltas',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StopwatchPage(),  // Tela principal do cronômetro
      ),
    );
  }
}
