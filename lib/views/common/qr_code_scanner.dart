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
      backgroundColor: Colors.black,
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
                    if (scanData != null) {
                      setState(() {
                        showProgress = true;
                        controller.stopCamera();
                      });
                      ApiResponse res =
                          await ApiHelper().attendance(scanData.code);

                      if (res.error) {
                        print('###########' + res.errorMessage + '###########');
                        Navigator.of(context).pop();

                        Future.delayed(Duration(seconds: 1));

                        Fluttertoast.showToast(
                            msg: 'Not Marked: ${res.errorMessage}');
                      } else {
                        Navigator.of(context).pop();
                        Future.delayed(Duration(seconds: 1));

                        Fluttertoast.showToast(
                          msg: 'Marked Present',
                        );
                      }

                      // controller.dispose();
                    }
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
