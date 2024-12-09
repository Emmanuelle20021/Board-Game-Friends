import 'package:board_game_friends/modules/auth/signup/components/form_field.dart';
import 'package:board_game_friends/shared/utils/constants.dart';
import 'package:board_game_friends/shared/utils/email_validator.dart';
import 'package:board_game_friends/shared/utils/extensions/int_to_gap.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: SvgPicture.asset(
                key: Key('logo'),
                //'assets/${Constants.kLogoBGFHorizontal}'
                Constants.kLogoBGFHorizontal,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 20,
              width: double.infinity,
              color: Colors.amberAccent,
            ),
            15.toVerticalGap,
            Text(
              '¡BIENVENIDO!',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            15.toVerticalGap,
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomFormField(
                      label: 'Usuario',
                      hintText: 'usuario@email.com',
                      prefixIcon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null) return '';
                        if (value.isEmpty) {
                          return 'Por favor, ingrese su correo electrónico';
                        }
                        if (!isEmailValid(value)) {
                          return 'Por favor, ingrese un correo electrónico válido';
                        }
                        return '';
                      },
                    ),
                    15.toVerticalGap,
                    CustomFormField(
                      label: 'Contraseña',
                      hintText: '********',
                      prefixIcon: Icons.lock,
                      controller: _passwordController,
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                      obscureText: _isPasswordVisible,
                      validator: (value) {
                        if (value == null) return '';
                        if (value.isEmpty) {
                          return 'Por favor, ingrese su contraseña';
                        }
                        return '';
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    15.toVerticalGap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Recordar contraseña',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: _rememberPassword,
                          onChanged: (value) {
                            setState(() {
                              _rememberPassword = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    15.toVerticalGap,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "INICIAR SESIÓN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    15.toVerticalGap,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Olvide mi ',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'usuario/contraseña',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                            onEnter: (event) => debugPrint('onEnter'),
                            recognizer: TapGestureRecognizer(),
                          ),
                        ],
                      ),
                    ),
                    15.toVerticalGap,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.accent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "CREAR CUENTA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
