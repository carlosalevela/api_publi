class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  AuthService._internal();

  // Simula la base de datos de usuarios
  final Map<String, Map<String, String>> _users = {};

  // Getter para acceder a los usuarios registrados
  Map<String, Map<String, String>> get users => _users;

  bool register(String username, String email, String password) {
    if (_users.containsKey(email)) {
      return false; // El usuario ya existe
    }
    _users[email] = {'username': username, 'password': password};
    return true;
  }

  bool login(String email, String password) {
    return _users[email]?['password'] == password;
  }
}

final authService = AuthService();
