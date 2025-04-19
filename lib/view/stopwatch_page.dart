import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/stopwatch_viewmodel.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key}) ; // 👈 Adicionei o key aqui

  @override
  Widget build(BuildContext context) {
    final stopwatchViewModel = Provider.of<StopwatchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 110, 142, 151),
        foregroundColor: const Color.fromARGB(255, 245, 243, 243),
        title: const Text(' Cronômetro '),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),

      // Corpo do cronômetro
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto do cronômetro com Semantics
          Center(
            child: Semantics(
              label: 'Tempo atual do cronômetro',
              value: stopwatchViewModel.currentTime,
              child: Text(
                stopwatchViewModel.currentTime,
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 11, 14),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(height: 30), // Espaço entre cronômetro e botões

          // Linha com três botões
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botão Iniciar / Pausar
              ElevatedButton(
                onPressed: stopwatchViewModel.isRunning
                    ? stopwatchViewModel.pauseTimer
                    : stopwatchViewModel.startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: stopwatchViewModel.isRunning
                      ? Colors.red
                      : const Color.fromARGB(255, 80, 241, 88),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
                child: Container(
                  color: Colors.blue,
                  child: Text(
                    stopwatchViewModel.isRunning ? 'Pausar' : 'Iniciar',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),

              // Botão Reiniciar com Semantics
              ElevatedButton(
                onPressed: stopwatchViewModel.resetTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
                child: Semantics(
                  label: 'Botão para reiniciar o cronômetro',
                  child: const Text(
                    'Reiniciar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),

              // Botão Registrar Volta
              ElevatedButton(
                onPressed: stopwatchViewModel.isRunning
                    ? stopwatchViewModel.recordLap
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 39, 129),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
                child: const Text(
                  'Registrar Volta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Lista de voltas
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
