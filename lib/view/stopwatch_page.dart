import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/stopwatch_viewmodel.dart';  

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              stopwatchViewModel.currentTime,
              style: const TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 11, 14),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              ElevatedButton(
                onPressed: stopwatchViewModel.isRunning
                    ? stopwatchViewModel.pauseTimer
                    : stopwatchViewModel.startTimer,
                child: const Text(
                  'Pausar / Iniciar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,         
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: stopwatchViewModel.isRunning
                      ? Colors.red
                      : const Color.fromARGB(255, 80, 241, 88),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
              ),
              ElevatedButton(
                onPressed: stopwatchViewModel.resetTimer,
                child: const Text(
                  'Reiniciar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,         
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
              ),
              ElevatedButton(
                onPressed: stopwatchViewModel.isRunning
                    ? stopwatchViewModel.recordLap
                    : null, 
                child: const Text(
                  'Registrar Volta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,         
                    fontSize: 28,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 59, 39, 129),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), 
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
