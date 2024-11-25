import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Para trabajar con archivos
import 'package:permission_handler/permission_handler.dart'; // Para manejar permisos

class AlmacenFormScreen extends StatefulWidget {
  @override
  _AlmacenFormScreenState createState() => _AlmacenFormScreenState();
}

class _AlmacenFormScreenState extends State<AlmacenFormScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _fotosSeleccionadas = [];

  // Función para verificar y pedir permisos de acceso a la galería
  Future<void> _verificarPermisos() async {
    PermissionStatus status = await Permission.photos.request();
    if (!status.isGranted) {
      // Si el permiso no está concedido, muestra un mensaje al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permiso denegado para acceder a las fotos')),
      );
    }
  }

  // Método para seleccionar imágenes desde la galería
  Future<void> _seleccionarFotos() async {
    // Verificar permisos antes de abrir la galería
    await _verificarPermisos();

    // Abre la galería y permite seleccionar múltiples imágenes
    final pickedFiles = await _picker.pickMultiImage();
    
    if (pickedFiles != null) {
      setState(() {
        // Convertir las rutas a archivos y agregar a la lista
        _fotosSeleccionadas = pickedFiles.map((e) => File(e.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Almacén'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para seleccionar fotos
            ElevatedButton(
              onPressed: _seleccionarFotos,
              child: Text('Seleccionar Fotos'),
            ),
            SizedBox(height: 16),
            
            // Muestra las fotos seleccionadas
            _fotosSeleccionadas.isEmpty
                ? Text('No se han seleccionado fotos.')
                : Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 columnas para las imágenes
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _fotosSeleccionadas.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Si deseas hacer algo al hacer clic en una imagen
                          },
                          child: Image.file(
                            _fotosSeleccionadas[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 16),
            // Aquí irían otros campos como el nombre, la descripción, etc.
          ],
        ),
      ),
    );
  }
}
