import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_page.dart';

//Inicio de la ejecución
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Inicializar la Aplicación móvil
    MaterialApp myApp = const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lista de Tareas",
      home: MyHomePage(title: "Lista de Tareas"),
    );

    return myApp;
  }
}
