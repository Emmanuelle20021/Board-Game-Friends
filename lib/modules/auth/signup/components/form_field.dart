import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType? inputType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.inputType,
    this.isPassword = false,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}
