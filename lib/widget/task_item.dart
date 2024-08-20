import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';

//Se utiliza un widget personalizado con varios widgets especificados.
Widget taskItem(Task task, VoidCallback onDelete) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: const Color.fromARGB(234, 230, 227, 227),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Título de la tarea
              Text(
                task.title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              //Descripción de la tarea
              Text(
                task.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ],
    ),
  );
}
