import 'package:flutter/material.dart';

class MyWidgetPadrao {
  DataColumn myDataCOlumn = DataColumn(
    label: Text(
      'Posição',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
  DataRow myDataRow = DataRow(
    cells: [
      DataCell(
        Text(
          'João',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
      DataCell(
        Text(
          'marcos',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
      DataCell(
        Text(
          'João',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
      DataCell(
        Text(
          'João',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
      DataCell(
        Text(
          'João',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
      DataCell(
        Text(
          'João',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    ],
  );
  TextStyle myBeautifulTextStyle = TextStyle(
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
}
