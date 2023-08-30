import 'package:flutter/material.dart';

class MyAddTABLE {
  DataRow? rows;

  static int pos = 0;

  final String nome;
  final double subtotal;
  final double quantidade;
  final double valorUnit;

  MyAddTABLE(
    this.nome,
    this.valorUnit,
    this.quantidade,
    this.subtotal,
  );

  void adicionarItem() {
    pos++;
    List<dynamic> listaInicial = [
      pos,
      1231451,
      nome,
      valorUnit,
      quantidade,
      subtotal,
    ];
    rows = DataRow(
      cells: [
        DataCell(
          Text(
            '${listaInicial[0]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '${listaInicial[1]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '${listaInicial[2]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '${listaInicial[3]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '${listaInicial[4]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '${listaInicial[5]}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
