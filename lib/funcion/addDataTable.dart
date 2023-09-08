import 'package:flutter/material.dart';

class MyAddTABLE {
  DataRow? rows;

  final String nome;
  final double subtotal;
  final double quantidade;
  final double valorUnit;
  final String cod;

  MyAddTABLE(
    this.nome,
    this.valorUnit,
    this.quantidade,
    this.subtotal,
    this.cod,
  );

  void adicionarItem() {
    rows = DataRow(
      cells: [
        DataCell(
          Text(
            cod,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            nome,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '$valorUnit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '$quantidade',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '$subtotal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
