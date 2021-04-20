import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/apis/apis.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScan extends StatefulWidget {
  QRCodeScan({Key key}) : super(key: key);

  @override
  _QRCodeScanState createState() => _QRCodeScanState();
}

class _QRCodeScanState extends State<QRCodeScan> {
  Barcode result;
  QRViewController controller;

  bool showProgress = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: showProgress
            ? Center(child: CircularProgressIndicator())
            : QRView(
                key: qrKey,
                onQRViewCreated: (QRViewController controller) {
                  setState(() {
                    this.controller = controller;
                  });
                  controller.scannedDataStream.listen((scanData) async {
                    setState(() {
                      result = scanData;
                      showProgress = true;
                      controller.stopCamera();
                    });
                    ApiResponse res =
                        await ApiHelper().attendance(scanData.code);
                   
                    if (res.error) {
                      Fluttertoast.showToast(msg: 'Not Marked');
                    } else {
                      Fluttertoast.showToast(msg: 'Marked Present');
                    }

                    // controller.dispose();
                    Navigator.of(context, rootNavigator: true).pop();
                  });
                },
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
