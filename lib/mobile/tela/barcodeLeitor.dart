import 'package:flutter/material.dart';
import 'package:barcode_scanner_kit/barcode_scanner_kit.dart' as barcode;

class BarCodeMobile extends StatefulWidget {
  const BarCodeMobile({super.key});

  @override
  State<BarCodeMobile> createState() => _BarCodeMobileState();
}

class _BarCodeMobileState extends State<BarCodeMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          barcode.BarcodeScanner;
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
