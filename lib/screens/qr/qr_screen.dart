import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_scanner/common/color_pallate.dart';
import 'package:ticket_scanner/common/widget/result_dialog.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MobileScannerController controller = MobileScannerController(
      formats: const [BarcodeFormat.qrCode],
    );
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
                  onDetect: (capture) async{
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
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
            ),
          ],
        ),
      ),
    );
  }
}

// class BarcodeScannerWithOverlay extends StatelessWidget {
//   const BarcodeScannerWithOverlay({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final MobileScannerController controller = MobileScannerController(
//       formats: const [BarcodeFormat.qrCode],
//     );
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           MobileScanner(
//             controller: controller,
//             onDetect: (capture) async {
//               final List<Barcode> barcodes = capture.barcodes;
//               String? scannedResult = barcodes.first.displayValue;

//               if (scannedResult != null) {
//                 controller.stop();
//                  ResultDialog(
//                   title: "Result Found",
//                   msg: scannedResult,
//                   controller: controller,
//                 ).show(context);
//               }
//             },
//           ),
//           CustomPaint(
//             size: MediaQuery.of(context).size,
//             painter: ScannerOverlay(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ScannerOverlay extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     const scanWindowWidth = 200.0;
//     const scanWindowHeight = 200.0;
//     final scanWindow = Rect.fromCenter(
//       center: Offset(size.width / 2, size.height / 2),
//       width: scanWindowWidth,
//       height: scanWindowHeight,
//     );

//     final backgroundPath = Path()
//       ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

//     final cutoutPath = Path()
//       ..addRRect(
//         RRect.fromRectAndCorners(
//           scanWindow,
//           topLeft: const Radius.circular(15),
//           topRight: const Radius.circular(15),
//           bottomLeft: const Radius.circular(15),
//           bottomRight: const Radius.circular(15),
//         ),
//       );

//     final backgroundWithCutout =
//         Path.combine(PathOperation.difference, backgroundPath, cutoutPath);

//     final backgroundPaint = Paint()
//       ..color = Colors.black.withOpacity(0.5)
//       ..style = PaintingStyle.fill
//       ..blendMode = BlendMode.dstOut;

//     final borderPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.5;

//     canvas.drawPath(backgroundWithCutout, backgroundPaint);
//     canvas.drawRRect(
//       RRect.fromRectAndCorners(
//         scanWindow,
//         topLeft: const Radius.circular(15),
//         topRight: const Radius.circular(15),
//         bottomLeft: const Radius.circular(15),
//         bottomRight: const Radius.circular(15),
//       ),
//       borderPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
