import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextStyle textStyle;
  final bool isPassword;
  final validate;
  final VoidCallback function;
  const NormalTextField({
    super.key,
    required this.controller,
    required this.function,
    required this.hintText,
    required this.labelText,
    required this.validate,
    required this.textStyle,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: textStyle,
          validator: validate,
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(labelText),
            hintStyle: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black,
            ),
            labelStyle: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextStyle textStyle;
  final validate;
  final bool isPassword;
  final VoidCallback function;
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.function,
    required this.hintText,
    required this.labelText,
    required this.textStyle,
    required this.validate,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: textStyle,
          validator: validate,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: function,
              icon: isPassword
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
            label: Text(labelText),
            labelStyle: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
