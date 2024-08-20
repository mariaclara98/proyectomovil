import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/widget/task_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [];

  void _addTask(String title, String description) {
    setState(() {
      tasks.add(Task(title: title, description: description));
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        backgroundColor: const Color.fromARGB(255, 236, 180, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    //Se usa el Widget personalizado como taskItem
                    child: taskItem(
                      tasks[index],
                      () => _confirmDeleteTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              //Muestra el AlertDialog con sus campos vacíos
              String title = '';
              String description = '';
              return AlertDialog(
                title: const Text('Añadir Nueva Tarea'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Título', hintText: 'Título de la tarea'),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Descripción',
                          hintText: 'Descripción de la tarea'),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      //Permite llamar a la funcion addTask, pasando tittle y description como parámetros
                      _addTask(title, description);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Añadir'),
                  ),
                  TextButton(
                    //Permite cancelar y cerrar el AlertDialog
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //Función generada para una confirmación de la eliminación de la tarea
  void _confirmDeleteTask(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const Text('¿Está seguro de eliminar esta tarea?'),
          actions: [
            TextButton(
              onPressed: () {
                _deleteTask(index); // Elimina la tarea
                Navigator.of(context).pop(); // Cierra el AlertDialog
              },
              child: const Text('Eliminar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el AlertDialog
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
