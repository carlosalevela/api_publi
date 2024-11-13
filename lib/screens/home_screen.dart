import 'package:flutter/material.dart';
import 'almacen_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido a la app de publicidad'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Al hacer clic, navegamos a la pantalla de detalles del almacén,
                // pasando el nombre y la descripción
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlmacenDetailScreen(
                      nombre: 'Almacén de Ropa', // Aquí pasamos el nombre
                      descripcion:
                          'Este es un almacén especializado en ropa.', // Aquí pasamos la descripción
                    ),
                  ),
                );
              },
              child: Text('Ver Detalles del Almacén'),
            ),
          ],
        ),
      ),
    );
  }
}
