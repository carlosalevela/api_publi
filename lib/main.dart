import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Pantalla de Login
import 'screens/register_screen.dart'; // Pantalla de Registro
import 'screens/home_screen.dart'; // Pantalla de Inicio
import 'screens/almacen_detail_screen.dart'; // Pantalla de Detalles de Almacén

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Publicidad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // La pantalla inicial será LoginScreen
      routes: {
        '/login': (context) => LoginScreen(), // Ruta para la pantalla de Login
        '/register': (context) =>
            RegisterScreen(), // Ruta para la pantalla de Registro
        '/home': (context) =>
            HomeScreen(), // Ruta para la pantalla Home (principal)
        '/almacen_detail': (context) => AlmacenDetailScreen(
            nombre: '', descripcion: ''), // Ruta para detalles del almacén
      },
    );
  }
}
