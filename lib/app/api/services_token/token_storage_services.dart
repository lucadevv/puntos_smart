import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageServices {
  final instance = SharedPreferences.getInstance();
  static const String _tokenKey = 'auth_token';

  TokenStorageServices();

  Future<String?> getToken() async {
    final prefs = await instance;
    return prefs.getString(_tokenKey);
  }

  Future<void> saveToken(String token) async {
    final prefs = await instance;
    await prefs.setString(_tokenKey, token);
  }

  Future<void> removeToken() async {
    final prefs = await instance;
    await prefs.remove(_tokenKey);
  }

  Future<void> saveLoginInfo(String user, String password) async {
    final prefs = await instance;

    if (user.isEmpty || password.isEmpty) {
      print(
          'No se puede guardar porque el usuario o la contraseña están vacíos.');
      return;
    }

    print('Guardando usuario: $user y contraseña.');
    await prefs.setString('saved_user', user);
    await prefs.setString('saved_password', password);
  }

  Future<Map<String, String?>> getLoginInfo() async {
    final prefs = await instance;
    final saveduser = prefs.getString('saved_user');
    final savedPassword = prefs.getString('saved_password');
    return {'saved_user': saveduser, 'saved_password': savedPassword};
  }

  Future<void> clearLoginInfo() async {
    final prefs = await instance;
    await prefs.remove('saved_user');
    await prefs.remove('saved_password');
  }
}
