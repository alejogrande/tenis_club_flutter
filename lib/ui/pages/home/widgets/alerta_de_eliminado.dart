import 'package:flutter/material.dart';

Future<void> showDeleteConfirmationDialog(BuildContext context, Function() onDeleteConfirmed) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmación'),
        content:const Text('¿Estás seguro de que deseas eliminar este agendamiento?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el diálogo
            },
          ),
          TextButton(
            child: const  Text('Eliminar'),
            onPressed: () {
              onDeleteConfirmed(); // Ejecuta la función de eliminación
              Navigator.of(context).pop(); // Cierra el diálogo
            },
          ),
        ],
      );
    },
  );
}