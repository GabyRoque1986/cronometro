import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/stopwatch_viewmodel.dart';  // Importação do ViewModel

class StopwatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatchViewModel = Provider.of<StopwatchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text('Cronômetro de Voltas'),
      ),
      body: Column(
        children: [
          Text(
            stopwatchViewModel.currentTime,
            style: TextStyle(fontSize: 60),
          ),
          ElevatedButton(
            onPressed: stopwatchViewModel.isRunning
                ? stopwatchViewModel.pauseTimer
                : stopwatchViewModel.startTimer,
            child: Text(stopwatchViewModel.isRunning ? 'Pausar' : 'Iniciar'),
          ),
          ElevatedButton(
            onPressed: stopwatchViewModel.resetTimer,
            child: Text('Reiniciar'),
          ),
          ElevatedButton(
            onPressed: stopwatchViewModel.recordLap,
            child: Text('Registrar Volta'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stopwatchViewModel.laps.length,
              itemBuilder: (context, index) {
                final lap = stopwatchViewModel.laps[index];
                return ListTile(
                  title: Text('Volta ${index + 1} - ${lap.lapTime}'),
                  subtitle: Text('Tempo Total: ${lap.totalTime}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
