import 'package:flutter/material.dart';

class MyAddTABLE {
  DataRow? table;

  void adicionarItem() {
    table = DataRow(
      cells: [
        DataCell(Text('Item 1')),
        DataCell(Text('Item 2')),
        DataCell(Text('Item 3')),
        DataCell(Text('Item 4')),
        DataCell(Text('Item 5')),
        DataCell(Text('Item 6')),
      ],
    );
  }
}
