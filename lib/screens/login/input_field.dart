import 'package:flutter/material.dart';
import 'package:ticket_scanner/common/color_pallate.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const InputField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: TextFormField(
        controller: controller,
        textInputAction:
            isPassword ? TextInputAction.done : TextInputAction.next,
        keyboardType: isPassword
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        obscureText: isPassword,
        validator: validator,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hint,
          fillColor: textFieldColor,
          filled: true,
          hintStyle: TextStyle(
            color: textHintColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          errorMaxLines: 1,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
        ),
        cursorErrorColor: primaryColor,
      ),
    );
  }
}
