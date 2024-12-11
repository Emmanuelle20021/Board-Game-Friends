import 'package:board_game_friends/modules/recover/components/recover_password_form.dart';
import 'package:flutter/material.dart';

class RecoverPasswordScreen extends StatelessWidget {
  static const routeName = '/recover-password';

  const RecoverPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar Contraseña"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "¿Olvidaste tu contraseña?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            RecoverPasswordForm(
              onRecoveryCompleted: () {
                Navigator.pushNamed(context, '/loading');
              },
            ),
          ],
        ),
      ),
    );
  }
}
