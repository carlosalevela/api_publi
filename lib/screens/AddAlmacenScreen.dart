import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; 
import '../models/almacen.dart';
import '../data/almacenes_data.dart';  // Importa el archivo donde está la lista almacenesData

class AddAlmacenScreen extends StatefulWidget {
  @override
  _AddAlmacenScreenState createState() => _AddAlmacenScreenState();
}

class _AddAlmacenScreenState extends State<AddAlmacenScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  String selectedPlan = 'Básico';
  String selectedCategoria = 'Comida';
  List<File> fotosSeleccionadas = [];
  
  final ImagePicker _picker = ImagePicker();

  // Método para seleccionar fotos desde la galería
  Future<void> _seleccionarFotos() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        fotosSeleccionadas = pickedFiles.map((e) => File(e.path)).toList();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No seleccionaste ninguna foto')),
      );
    }
  }

  // Validar campos antes de guardar
  bool _validarCampos() {
    if (nombreController.text.isEmpty ||
        descripcionController.text.isEmpty ||
        direccionController.text.isEmpty ||
        fotosSeleccionadas.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Almacén')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo para el nombre del almacén
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre del almacén'),
              ),
              SizedBox(height: 10),

              // Campo para la descripción del almacén
              TextField(
                controller: descripcionController,
                decoration: InputDecoration(labelText: 'Descripción del almacén'),
              ),
              SizedBox(height: 10),

              // Campo para la dirección del almacén
              TextField(
                controller: direccionController,
                decoration: InputDecoration(labelText: 'Dirección del almacén'),
              ),
              SizedBox(height: 10),

              // Dropdown para seleccionar la categoría
              DropdownButton<String>(
                value: selectedCategoria,
                items: ['Comida', 'Ropa', 'Deporte', 'Tecnología']
                    .map((categoria) => DropdownMenuItem(
                          value: categoria,
                          child: Text(categoria),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategoria = value!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Dropdown para seleccionar el plan
              DropdownButton<String>(
                value: selectedPlan,
                items: ['Premium', 'Medio', 'Básico']
                    .map((plan) => DropdownMenuItem(
                          value: plan,
                          child: Text(plan),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value!;
                  });
                },
              ),
              SizedBox(height: 10),

              // Botón para seleccionar fotos
              ElevatedButton(
                onPressed: _seleccionarFotos,
                child: Text('Seleccionar Fotos'),
              ),
              SizedBox(height: 10),

              // Muestra las fotos seleccionadas
              fotosSeleccionadas.isNotEmpty
                  ? Wrap(
                      spacing: 10,
                      children: fotosSeleccionadas
                          .map((file) => Image.file(file, height: 100, width: 100))
                          .toList(),
                    )
                  : Text('No se han seleccionado fotos'),

              SizedBox(height: 20),

              // Botón para guardar el almacén
              ElevatedButton(
                onPressed: () {
                  if (_validarCampos()) {
                    Almacen nuevoAlmacen = Almacen(
                      nombre: nombreController.text,
                      descripcion: descripcionController.text,
                      direccion: direccionController.text,
                      plan: selectedPlan,
                      categoria: selectedCategoria,
                      fotos: fotosSeleccionadas
                          .map((file) => file.path)  // Convertir el File a su path
                          .toList(),
                    );

                    // Guardar el almacén en la lista 'almacenesData'
                    setState(() {
                      almacenesData.add(nuevoAlmacen); // Añade el nuevo almacén a la lista
                    });

                    // Regresar a la pantalla anterior
                    Navigator.pop(context);
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
