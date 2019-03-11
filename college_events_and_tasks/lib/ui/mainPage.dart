import 'package:college_events_and_tasks/ui/eventsandtasks_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("LISTA de Tarefas da Faculdade"),
        backgroundColor: Colors.yellow,
      ),
      body: new EventsAndTasksScreen(),
    );
  }
}


