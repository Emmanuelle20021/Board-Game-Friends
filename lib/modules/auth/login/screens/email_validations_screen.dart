import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:board_game_friends/shared/utils/email_validator.dart';

class EmailValidationScreen extends StatefulWidget {
  const EmailValidationScreen({super.key});

  @override
  EmailValidationScreenState createState() => EmailValidationScreenState();
}

class EmailValidationScreenState extends State<EmailValidationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  String? _emailError;

  void _validateEmail() {
    String email = _emailController.text.trim();

    if (!isEmailValid(email)) {
      setState(() {
        _emailError =
            "Correo electrónico inválido. Incluye un '@' y un dominio como '.com'.";
      });

      // Feedback táctil y visual para errores
      HapticFeedback.vibrate();
      _scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(_emailError!),
          duration: const Duration(seconds: 4),
        ),
      );
    } else {
      setState(() {
        _emailError = null;
      });

      HapticFeedback.lightImpact();
      _scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text("Correo electrónico válido."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(title: const Text("Validación de Correo Electrónico")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                label: "Campo para ingresar el correo electrónico",
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    hintText: "Ejemplo: usuario@dominio.com",
                    errorText: _emailError,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (_) => _validateEmail(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateEmail,
                child: const Text("Validar correo"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
