class Almacen {
  final String nombre;
  final String descripcion;
  final String direccion; // Ahora solo dirección
  final String plan;
  final String categoria;
  final List<String> fotos;
  
  Almacen({
    required this.nombre,
    required this.descripcion,
    required this.direccion, // Ahora es requerido
    required this.plan,
    required this.categoria,
    required this.fotos,
  });
}
