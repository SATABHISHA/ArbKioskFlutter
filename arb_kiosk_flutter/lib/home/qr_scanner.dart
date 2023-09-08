

import 'dart:convert';
// import 'dart:js_util';

import 'package:arb_kiosk_flutter/attendance/user_check_in_out.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerApp extends StatefulWidget {
  final CameraDescription camera;
  static var ScannedQRCodeData;

  QRScannerApp({required this.camera});
  static String id = 'QRScanner';
  @override
  _QRScannerAppState createState() => _QRScannerAppState();
}

class _QRScannerAppState extends State<QRScannerApp> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late QRViewController controller;

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return Scaffold(
      appBar: AppBar(
        // title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              // cameraDirection: CameraLensDirection.front, // Use the front camera by default
              cameraFacing: CameraFacing.front,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea,),

            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    controller.flipCamera(); // Switch between available cameras
                  },
                  child: Text('Switch Camera'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildScannerLine() {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 2,
          width: double.infinity,
          color: Colors.red,
        ),
        SizedBox(height: 10),
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 2,
          width: double.infinity,
          color: Colors.red,
          transform: Matrix4.translationValues(0.0, 155.0, 0.0),
        ),
      ],
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Handle scanned QR code data here
      print('Scanned QR Code: ${scanData.code}');
      QRScannerApp.ScannedQRCodeData = json.decode(scanData.code as String);
      // QRScannerApp.ScannedQRCodeData = scanData.code;
      Navigator.pushNamed(context, UserCheckInOut.id);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}