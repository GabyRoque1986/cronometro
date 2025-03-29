import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/stopwatch_viewmodel.dart';  

class StopwatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stopwatchViewModel = Provider.of<StopwatchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 110, 142, 151),
        foregroundColor: const Color.fromARGB(255, 245, 243, 243),
        title: Text(' Cronômetro '),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto', 
        ),
      ),

      // Corpo do cronômetro
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto do cronômetro
          Center(
            child: Text(
              stopwatchViewModel.currentTime,
              style: TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 12, 11, 14),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 30), // Espaçamento entre o cronômetro e os botões

          // Linha com os três botões
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os botões
            children: [
              // Botão Iniciar ou Pausar (Esquerda)
              ElevatedButton(
                onPressed: stopwatchViewModel.isRunning
                    ? stopwatchViewModel.pauseTimer
                    : stopwatchViewModel.startTimer,
                child: Text(
                  stopwatchViewModel.isRunning ? 'Pausar' : 'Iniciar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Negrito
                    color: Colors.black,         // Preto
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: stopwatchViewModel.isRunning
                      ? Colors.red
                      : const Color.fromARGB(255, 80, 241, 88),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
              ),

              // Botão Reiniciar (Meio)
              ElevatedButton(
                onPressed: stopwatchViewModel.resetTimer,
                child: Text(
                  'Reiniciar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Negrito
                    color: Colors.black,         // Preto
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
              ),

              // Botão Registrar Volta (Direita)
              ElevatedButton(
                onPressed: stopwatchViewModel.isRunning
                    ? stopwatchViewModel.recordLap
                    : null, // Desabilita se não estiver rodando
                child: Text(
                  'Registrar Volta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Negrito
                    color: Colors.black,         // Preto
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 39, 129),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
              ),
            ],
          ),

          SizedBox(height: 20), // Espaçamento entre botões e lista

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
