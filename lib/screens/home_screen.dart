import 'dart:io';
import 'package:flutter/material.dart';
import '../service/auth_service.dart'; // Asegúrate de que el AuthService esté importado
import '../screens/AddAlmacenScreen.dart';
import '../models/almacen.dart'; // Asegúrate de tener este modelo
import '../data/almacenes_data.dart'; // Lista global de almacenes
import '../widgets/category_list.dart'; // Importa el widget de categorías
import '../widgets/almacen_card.dart'; // Importa el widget de la tarjeta de almacén

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Almacen> almacenes = List.from(almacenesData);

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = authService.users.keys.firstWhere(
      (email) => authService.users[email] != null,
      orElse: () => 'Usuario',
    );

    final currentUserName =
        authService.users[currentUserEmail]?['username'] ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenido, $currentUserName!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CategoryList(),
              SizedBox(height: 20),
              Text(
                'Almacenes Sugeridos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              almacenes.isEmpty
                  ? Center(
                      child: Text(
                        'No hay almacenes registrados.',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: almacenes.length,
                      itemBuilder: (context, index) {
                        final Almacen almacen = almacenes[index];
                        return AlmacenCard(
                          almacen: almacen,
                          onTap: () => _mostrarDetalleAlmacen(context, almacen),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevoAlmacen = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAlmacenScreen()),
          );

          if (nuevoAlmacen != null) {
            setState(() {
              almacenes.add(nuevoAlmacen);
            });
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Agregar Almacén',
      ),
    );
  }

  void _mostrarDetalleAlmacen(BuildContext context, Almacen almacen) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(almacen.nombre, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Descripción: ${almacen.descripcion}'),
              SizedBox(height: 10),
              Text('Categoría: ${almacen.categoria}'),
              Text('Plan: ${almacen.plan}'),
              SizedBox(height: 10),
              almacen.fotos.isNotEmpty
                  ? Wrap(
                      spacing: 10,
                      children: almacen.fotos
                          .map((foto) => Image.file(File(foto), height: 100, width: 100, fit: BoxFit.cover))
                          .toList(),
                    )
                  : Text('No hay fotos disponibles.'),
            ],
          ),
        );
      },
    );
  }
}
