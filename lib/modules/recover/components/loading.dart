import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _sendEmail();
  }

  Future<void> _sendEmail() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushNamed(context, '/password-reset-sent');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/sending_email.json',
                width: 150, height: 150, fit: BoxFit.cover),
            const SizedBox(height: 20),
            const Text("Enviando correo..."),
          ],
        ),
      ),
    );
  }
}
