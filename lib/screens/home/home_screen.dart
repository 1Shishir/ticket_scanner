import 'package:flutter/material.dart';
import 'package:ticket_scanner/common/color_pallate.dart';
import 'package:ticket_scanner/common/widget/login_button.dart';
import 'package:ticket_scanner/common/widget/logout_button.dart';
import 'package:ticket_scanner/screens/qr/qr_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(14.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.44),
                      offset: const Offset(0, 6),
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Bangladesh Rockfest V.2",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Total Scan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "2149",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: LoginButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QrScreen(),
                      ),
                    );
                  },
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "Start Scanning",
                ),
              ),
              const Spacer(),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
