import 'package:flutter/material.dart';
import '../models/almacen.dart'; // Asegúrate de que el modelo Almacen esté importado

class AlmacenCard extends StatelessWidget {
  final Almacen almacen;
  final VoidCallback onTap; // Parámetro para manejar el tap

  // Constructor para recibir el objeto Almacen y la función onTap
  AlmacenCard({required this.almacen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Asignamos la función 'onTap' que se pasa como parámetro
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // Imagen a la izquierda, con control de tamaño
              almacen.fotos.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        almacen.fotos[0], // URL de la imagen
                        height: 80, // Ajuste de altura para evitar desbordamiento
                        width: 80,  // Ajuste de ancho para evitar desbordamiento
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.store,
                      size: 80, // Ajuste del tamaño del icono
                      color: Colors.grey,
                    ),
              SizedBox(width: 16), // Espacio entre la imagen y el texto
              // Información a la derecha
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre del almacen
                    Text(
                      almacen.nombre,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // Evita el desbordamiento del nombre
                    ),
                    SizedBox(height: 8),
                    // Descripción del almacen
                    Text(
                      almacen.descripcion,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Evita el desbordamiento de la descripción
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        // Categoría del almacen
                        Text(
                          'Categoría: ${almacen.categoria}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
