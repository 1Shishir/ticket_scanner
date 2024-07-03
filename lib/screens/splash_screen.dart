import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_scanner/screens/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
    return Scaffold(
      backgroundColor: const Color(0XFFAE6CF8),
      body: Center(
        child: Hero(
          tag: "splashscreen",
          child: SvgPicture.asset("assets/images/GoEventy_Icon.svg"),
        ),
      ),
    );
  }
}
