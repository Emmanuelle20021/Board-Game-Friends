import 'package:board_game_friends/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordConfirmScreen extends StatelessWidget {
  final String email;

  const PasswordConfirmScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 16.0 : 32.0,
          vertical: 24.0,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/forgot_password.svg',
                height: isSmallScreen ? 100 : 150,
              ),
              const SizedBox(height: 30),
              Text(
                'Correo de recuperación enviado',
                style: Constants.kThemeData.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                email,
                style: Constants.kThemeData.textTheme.bodyMedium!
                    .copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'La seguridad de tu cuenta es nuestra prioridad. Te hemos enviado un enlace seguro para que puedas cambiar tu contraseña de manera segura y proteger tu cuenta.',
                style: Constants.kThemeData.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/login'));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  "Hecho",
                  style: Constants.kThemeData.textTheme.labelLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  print('Reenviar correo clicado');
                },
                child: Text(
                  "Reenviar correo",
                  style: Constants.kThemeData.textTheme.labelMedium!
                      .copyWith(color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
