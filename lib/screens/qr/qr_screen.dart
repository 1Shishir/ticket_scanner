import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_scanner/common/color_pallate.dart';
import 'package:ticket_scanner/common/widget/logout_button.dart';
import 'package:ticket_scanner/common/widget/result_dialog.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late final MobileScannerController controller;
  bool isTorchEnable=false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      formats: const [BarcodeFormat.qrCode],
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                left: 5.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/images/Goeventy_text_logo.svg",
              height: 43.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 300.0,
              width: 300.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(14.0),
                ),
                child: MobileScanner(
                  controller: controller,
                  onDetect: (capture) async {
                    final List<Barcode> barcodes = capture.barcodes;
                    String? scannedResult = barcodes.first.displayValue;
                    if (scannedResult != null) {
                      controller.stop();
                      await ResultDialog(
                        title: "Result Found",
                        msg: scannedResult,
                        controller: controller,
                      ).show(context);
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IconButton.filled(
                onPressed: () {
                  setState(() {
                    controller.toggleTorch();
                    isTorchEnable=!isTorchEnable;
                  });
                },
                icon: Icon(
                  isTorchEnable
                      ? Icons.flash_off_rounded
                      : Icons.flash_on_rounded,
                ),
              ),
            ),
            const Spacer(),
            const LogoutButton()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
