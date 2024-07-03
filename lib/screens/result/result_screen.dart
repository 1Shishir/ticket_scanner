import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String scannedData;

  const ResultScreen({super.key, required this.scannedData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Result'),
      ),
      body: Center(
        child: Text(
          'Scanned QR Code: $scannedData',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
