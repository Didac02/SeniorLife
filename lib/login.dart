// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:seriorlife/home.dart';


// Usuarios registrados en la base de datos de SeniorLife

Map<String, String> _users = {
  'demo1@gmail.com': '12345',
  'demo2@gmail.com': 'demo2',
};


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Duration get _login_time => const Duration(milliseconds: 2250);
  
  // Autentificación de usuario
  Future<String?> _Auth_user(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(_login_time).then((_) {
      if (!_users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (_users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  // Registro de usuario
  Future<String?> _Sign_up(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    _users[data.name!] = data.password!;
    return Future.delayed(_login_time).then((_) {
      return null;
    });
  }

  // Recuperación de contraseña
  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(_login_time).then((_) {
      if (!_users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      //title: 'SeniorLife',
      logo: const AssetImage('Logos/SeniorLife_logo2.png',),
      onLogin: _Auth_user,
      onSignup: _Sign_up,
      theme: LoginTheme(
        logoWidth: 10,
        primaryColor: const Color.fromRGBO(21, 101, 188, 1)
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Home(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}