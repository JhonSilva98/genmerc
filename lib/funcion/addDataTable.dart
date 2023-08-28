import 'package:flutter/material.dart';

class MyAddTABLE {
  DataRow? table;
  final String nome;
  final double valor;
  MyAddTABLE(this.nome, this.valor);

  void adicionarItem() {
    List<dynamic> listaInicial = [1, 1231451, nome, 5, 3, valor];
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
