import 'package:flutter/material.dart';
import 'package:college_events_and_tasks/ui/firstPage.dart';
import 'package:college_events_and_tasks/ui/mainPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Eventos e Tarefas da Faculdade',

    // Inicie o aplicativo com a rota "/".
    // No nosso caso, o aplicativo será iniciado no widget FirstPage
    initialRoute: '/',
    routes: {

      // Quando navegamos para a rota "/", construímos o widget FirstPage
      '/': (context) => FirstPage(),

      //Quando navegamos para a rota "/", construímos o widget da MainPage
      '/main': (context) => MainPage(),
    },

    // Retira o banner de debug mode do canto superior direito da tela
    debugShowCheckedModeBanner: false,
  ));
}






