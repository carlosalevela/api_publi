import 'package:flutter/material.dart';

class AlmacenDetailScreen extends StatelessWidget {
  final String nombre;
  final String descripcion;

  // Constructor que recibe los parámetros 'nombre' y 'descripcion'
  AlmacenDetailScreen({required this.nombre, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Almacén'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(descripcion),
          ],
        ),
      ),
    );
  }
}
