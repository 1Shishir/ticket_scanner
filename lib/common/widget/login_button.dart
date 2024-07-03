import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const LoginButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: backgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
