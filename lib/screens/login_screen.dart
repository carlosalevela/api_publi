import 'package:flutter/material.dart';
import 'home_screen.dart'; // Asegúrate de importar la pantalla Home

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo electrónico';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor ingresa un correo electrónico válido';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa una contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  // Esta función simula un login exitoso
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes agregar la lógica real de autenticación si la necesitas
      // Por ejemplo: FirebaseAuth, API Rest, etc.

      // Mostrar un mensaje indicando que la autenticación fue exitosa
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Iniciando sesión...')));

      // Después de login exitoso, redirigimos a la pantalla principal (HomeScreen)
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo para correo electrónico
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              SizedBox(height: 16),

              // Campo para contraseña
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Para ocultar la contraseña
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: _validatePassword,
              ),
              SizedBox(height: 24),

              // Botón para iniciar sesión
              ElevatedButton(
                onPressed: _login,
                child: Text('Iniciar sesión'),
              ),
              SizedBox(height: 16),

              // Enlace para registrarse si no tiene cuenta
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('¿No tienes cuenta? Regístrate aquí'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
