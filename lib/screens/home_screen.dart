import 'package:flutter/material.dart';
import '../service/auth_service.dart'; // Asegúrate de que el AuthService esté importado
import 'almacen_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el correo del usuario autenticado
    final currentUserEmail = authService.users.keys.firstWhere(
      (email) => authService.users[email] != null,
      orElse: () => 'Usuario',
    );

    // Obtener el nombre de usuario
    final currentUserName =
        authService.users[currentUserEmail]?['username'] ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Al cerrar sesión, regresamos a la pantalla de inicio de sesión
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido, $currentUserName!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Bienvenido a la app de publicidad'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de detalles del almacén
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
