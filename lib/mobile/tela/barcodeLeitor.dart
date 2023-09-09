import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:genmerc/desktop/tela/telaTest.dart';
import 'package:genmerc/funcion/bancodedados.dart';
import 'package:audioplayers/audioplayers.dart';

class BarCodeMobile extends StatefulWidget {
  const BarCodeMobile({super.key});

  @override
  State<BarCodeMobile> createState() => _BarCodeMobileState();
}

class _BarCodeMobileState extends State<BarCodeMobile> {
  final player = AudioPlayer();
  String _scanBarcode = 'Unknown';
  String recentCod = '';

  Future<void> executarFuncaoBarcode(
    String cod,
  ) async {
    BdFiredart dados = BdFiredart();
    await dados.addBancoFiredart(cod, context);
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) async {
      if (barcode != '-1') {
        if (recentCod != barcode) {
          await player.play(AssetSource('beep-07a.mp3'));
          print(barcode);
          recentCod = barcode;
          // Exibir o SnackBar com o valor do código de barras
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const Teste(),
            ),
          );
        }
      }
      //await executarFuncaoBarcode('7894321722016');
    });
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      await player.play(AssetSource('assets/beep-07a.mp3'));
      //await executarFuncaoBarcode(barcodeScanRes);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    scanQR();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (barcodeScanRes != '-1') {
        await player.play(AssetSource('beep-07a.mp3'));
        await executarFuncaoBarcode(barcodeScanRes);
        await scanBarcodeNormal();
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => scanBarcodeNormal(),
                      child: Text('Start barcode scan')),
                  /*ElevatedButton(
                      onPressed: () => scanQR(), child: Text('Start QR scan')),
                  ElevatedButton(
                      onPressed: () => startBarcodeScanStream(),
                      child: Text('Start barcode scan stream')),*/
                  Text('Scan result : $_scanBarcode\n',
                      style: TextStyle(fontSize: 20))
                ])));
  }
}
