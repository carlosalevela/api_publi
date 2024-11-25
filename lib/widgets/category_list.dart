import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Comida', 'icon': '🍔'},
    {'name': 'Ropa', 'icon': '👗'},
    {'name': 'Deporte', 'icon': '⚽'},
    {'name': 'Televisores', 'icon': '📺'},
    {'name': 'Repuestos', 'icon': '🔧'},
    {'name': 'Más', 'icon': '➕'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Esto permitirá hacer scroll si el contenido se desborda
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                // Icono redondeado
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[100], // Color de fondo
                  ),
                  padding: const EdgeInsets.all(10.0), // Tamaño del icono
                  child: Text(
                    category['icon']!,
                    style: TextStyle(fontSize: 24), // Reducir el tamaño del icono
                  ),
                ),
                SizedBox(height: 8),
                // Nombre de la categoría
                Text(
                  category['name']!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
