import 'package:flutter/material.dart';

class MyWidgetPadrao {
  static TextStyle myBeautifulTextStyle = TextStyle(
    color: Colors.white, // Cor do texto
    fontSize: 50.0, // Tamanho da fonte
    fontWeight: FontWeight.bold, // Peso da fonte (negrito)
    letterSpacing: 1.2, // Espaçamento entre caracteres
    wordSpacing: 2.0, // Espaçamento entre palavras
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(2, 2),
        blurRadius: 3,
      ),
    ], // Sombreamento do texto
  );
  static TextStyle myBeautifulTextStyleBlack = TextStyle(
    color: Colors.black, // Cor do texto
    fontSize: 50.0, // Tamanho da fonte
    fontWeight: FontWeight.bold, // Peso da fonte (negrito)
    letterSpacing: 1.2, // Espaçamento entre caracteres
    wordSpacing: 2.0, // Espaçamento entre palavras
    shadows: [
      Shadow(
        color: Colors.white,
        offset: Offset(2, 2),
        blurRadius: 3,
      ),
    ], // Sombreamento do texto
  );
}
