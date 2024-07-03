import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_scanner/common/color_pallate.dart';
import 'package:ticket_scanner/common/validators.dart';
import 'package:ticket_scanner/common/widget/login_button.dart';
import 'package:ticket_scanner/screens/home/home_screen.dart';
import 'package:ticket_scanner/screens/login/input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.12),
                  child: Hero(
                    tag: "splashscreen",
                    child: SvgPicture.asset(
                      "assets/images/GoEventy_Icon.svg",
                      height: 130,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Login to Scan",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                InputField(
                    controller: emailController,
                    validator: (value) => validateEmail(
                          value: value,
                        ),
                    hint: "Enter Your Email"),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                  child: InputField(
                      controller: passwordController,
                      validator: (value) => validatePassword(
                            value: value,
                          ),
                      hint: "Enter Your Password",
                      isPassword: true),
                ),
                LoginButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                      emailController.clear();
                      passwordController.clear();
                    },
                    backgroundColor: Colors.white,
                    textColor: textColor,
                    text: "Login"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
