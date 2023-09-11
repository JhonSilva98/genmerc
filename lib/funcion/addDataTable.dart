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
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            nome,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '$valorUnit',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '$quantidade',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Text(
            '$subtotal',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
