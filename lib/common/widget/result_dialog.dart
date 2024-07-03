import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_scanner/common/color_pallate.dart';

class ResultDialog extends StatelessWidget {
  final String title;
  final String msg;
  final MobileScannerController controller;

  const ResultDialog({
    super.key,
    required this.title,
    required this.msg,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Done',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    ).then((_) => controller.start());
  }
}
