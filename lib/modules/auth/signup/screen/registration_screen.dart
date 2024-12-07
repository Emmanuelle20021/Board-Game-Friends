import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:board_game_friends/modules/auth/signup/components/form_field.dart';
import 'package:board_game_friends/shared/utils/constants.dart';
import 'package:csc_picker/csc_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _usernameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _termsAccepted = false;
  bool _isFormValid = false;
  String? _passwordError;

  @override
  void initState() {
    super.initState();

    // Escuchar cambios en los campos para validar el formulario
    _usernameController.addListener(_validateForm);
    _birthdateController.addListener(_validateForm);
    _countryController.addListener(_validateForm);
    _cityController.addListener(_validateForm);
    _stateController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Liberar recursos de los controladores
    _usernameController.dispose();
    _birthdateController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      // Verificar si las contraseñas coinciden
      if (_passwordController.text != _confirmPasswordController.text) {
        _passwordError = 'Las contraseñas no coinciden';
      } else {
        _passwordError = null;
      }

      //password entre 8 y 40 caracteres
      if (_passwordController.text.length < 8 || _passwordController.text.length > 40) {
        _passwordError = 'La contraseña debe tener entre 8 y 40 caracteres';
      }



      // Validar que todos los campos estén completos y las contraseñas coincidan
      _isFormValid = _usernameController.text.isNotEmpty &&
          _birthdateController.text.isNotEmpty &&
          _countryController.text.isNotEmpty &&
          _cityController.text.isNotEmpty &&
          _stateController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _termsAccepted &&
          isAdult() &&
          _passwordError == null;
    });
  }

  //detectar si el usuario es mayor de edad
  bool isAdult() {
    final input = _birthdateController.text;

    if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(input)) {
      print('Error: El formato de la fecha debe ser dd/MM/yyyy.');
      return false;
    }

    try {
      // Separar día, mes y año
      final parts = input.split('/');
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final birthdate = DateTime(year, month, day);
      final now = DateTime.now();
      final daysPerYear = 365.25;
      final difference = now.difference(birthdate).inDays;
      final years = difference / daysPerYear;

      return years >= 18;
    } catch (e) {
      print('Error: Fecha inválida.');
      return false;
    }
  }


  Future<void> _selectBirthdate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
      _birthdateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: SvgPicture.asset(
          Constants.kLogoBGFHorizontal,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Por favor rellena todos los campos a continuación para registrarte",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            CustomFormField(
              controller: _usernameController,
              label: "Nombre de usuario",
              hintText: "Introduce tu nombre de usuario",
              prefixIcon: Icons.person,
            ),

            GestureDetector(
              onTap: () => _selectBirthdate(context),
              child: AbsorbPointer(
                child: CustomFormField(
                  controller: _birthdateController,
                  label: "Fecha de nacimiento",
                  hintText: "DD/MM/AAAA",
                  prefixIcon: Icons.calendar_today,
                  inputType: TextInputType.none,
                ),
              ),
            ),



            CSCPicker(
              onCountryChanged: (value) {
                setState(() {
                  _countryController.text = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  _stateController.text = value??"";
                });
              },
              onCityChanged: (value) {
                setState(() {
                  _cityController.text = value??"";
                });
              },

              showStates: true,
              showCities: true,
              flagState: CountryFlag.DISABLE,
              //Tipo de letra y color del dropdown acorde a los otros campos
                dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //texto
                border: Border.all(color: Colors.orange),
              ),
                selectedItemStyle: TextStyle( color:Colors.grey[600], fontSize: 16),





              //flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,






            ),


          /*
              //Labels reemplazados por CSCPicker
            CustomFormField(
              controller: _countryController,
              label: "País",
              hintText: "Introduce tu país",
              prefixIcon: Icons.flag,
            ),

            CustomFormField(
              controller: _cityController,
              label: "Ciudad y Estado",
              hintText: "Introduce tu ciudad y estado",
              prefixIcon: Icons.location_city,
            ),
          */
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Recuerda que debes ser mayor de 18 años para ser parte de esta comunidad.",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            CustomFormField(
              controller: _emailController,
              label: "Correo electrónico",
              hintText: "Introduce tu correo",
              prefixIcon: Icons.email,
              inputType: TextInputType.emailAddress,
            ),

            CustomFormField(
              controller: _passwordController,
              label: "Contraseña",
              hintText: "Introduce tu contraseña",
              prefixIcon: Icons.lock,
              isPassword: true,
            ),

            CustomFormField(
              controller: _confirmPasswordController,
              label: "Confirmar contraseña",
              hintText: "Confirma tu contraseña",
              prefixIcon: Icons.lock,
              isPassword: true,
              errorText: _passwordError,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                      _validateForm();
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Acepto los Términos de Servicio y Políticas de Privacidad",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Botón de registro
            Center(
              child: ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        // Acción del botón
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                ),
                child: Text(
                  "CREAR CUENTA",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
