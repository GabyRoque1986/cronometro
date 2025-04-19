import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/stopwatch_viewmodel.dart';
import 'service/notification_service.dart';
import 'view/stopwatch_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (_) => StopwatchViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro',
      debugShowCheckedModeBanner: false, 
      home: StopwatchPage(),
    );
  }
}
