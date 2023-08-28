import 'package:flutter/material.dart';

class MyAddTABLE {
  DataRow? table;
  final String nome;
  final double valor;
  final double quantidade;
  final double valorUnit;
  MyAddTABLE(this.nome, this.valor, this.quantidade, this.valorUnit);

  void adicionarItem() {
    List<dynamic> listaInicial = [
      1,
      1231451,
      nome,
      valorUnit,
      quantidade,
      valor
    ];
    table = DataRow(
      cells: [
        DataCell(Text('${listaInicial[0]}')),
        DataCell(Text('${listaInicial[1]}')),
        DataCell(Text('${listaInicial[2]}')),
        DataCell(Text('${listaInicial[3]}')),
        DataCell(Text('${listaInicial[4]}')),
        DataCell(Text('${listaInicial[5]}')),
      ],
    );
  }
}
