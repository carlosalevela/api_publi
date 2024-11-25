import 'package:flutter/material.dart';
import 'dart:io';  // Para usar File y mostrar las imágenes de fotos
import '../models/almacen.dart';  // Importar el modelo de Almacen

class AlmacenDetailScreen extends StatelessWidget {
  final Almacen almacen;

  AlmacenDetailScreen({Key? key, required this.almacen}) : super(key: key);

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
              almacen.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Descripción: ${almacen.descripcion}'),
            SizedBox(height: 10),
            Text('Dirección: ${almacen.direccion}'),
            SizedBox(height: 10),
            Text('Categoría: ${almacen.categoria}'),
            SizedBox(height: 10),
            Text('Plan: ${almacen.plan}'),
            SizedBox(height: 10),
            almacen.fotos.isNotEmpty
                ? Wrap(
                    spacing: 10,
                    children: almacen.fotos
                        .map((foto) => Image.asset(foto, height: 100, width: 100))
                        .toList(),
                  )
                : Text('No hay fotos disponibles'),
          ],
        ),
      ),
    );
  }
}
