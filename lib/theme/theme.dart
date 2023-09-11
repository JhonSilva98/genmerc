import 'package:flutter/material.dart';
import 'package:genmerc/desktop/tela/login.dart';
import 'package:genmerc/mobile/tela/barcodeLeitor.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const BarCodeMobile(), //MyLogin() ,
    );
  }
}
