import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_scanner/common/color_pallate.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/logout_icon.svg"),
          Text(
            " logout",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: logoutColor,
            ),
          )
        ],
      ),
    );
  }
}
