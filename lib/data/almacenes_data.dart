import '../models/almacen.dart'; // Asegúrate de que Almacen esté importado

// Aquí defines una lista de almacenes con los datos simulados
List<Almacen> almacenesData = [
  Almacen(
    nombre: 'PANAMA PLAZA',
    descripcion: 'Descripción del Almacén 1',
    direccion: 'Calle Ficticia 123, Ciudad X',
    plan: 'Plan básico',
    categoria: 'Comida',
    fotos: ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_wwAyaH7a-0wnM-ixkHQxCiLsXgquvU4tAQ&s'], // Rutas de fotos de ejemplo
  ),
  Almacen(
    nombre: 'LA MERCED',
    descripcion: 'Descripción del Almacén 2',
    direccion: 'Avenida Imaginaria 456, Ciudad Y',
    plan: 'Plan premium',
    categoria: 'Electrónica',
    fotos: ['https://i.ytimg.com/vi/kBvJqhoHRtw/sddefault.jpg'],
  ),
  Almacen(
    nombre: 'MISTER POLLO',
    descripcion: 'Descripción del Almacén 3',
    direccion: 'Plaza Central 789, Ciudad Z',
    plan: 'Plan gratuito',
    categoria: 'Ropa',
    fotos: ['https://www.ccunicentropasto.com/wp-content/uploads/2022/09/2-05_mister-pollo_fachada_2022.jpg'],
  ),
];
