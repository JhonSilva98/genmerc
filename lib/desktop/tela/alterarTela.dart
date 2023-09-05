import 'package:flutter/material.dart';
import 'package:genmerc/desktop/tela/telaTest.dart';
import 'package:genmerc/desktop/tela/vender.dart';

class ContentDisplayWidget extends StatelessWidget {
  final int selectedIndex;

  ContentDisplayWidget({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return MyVender(); // Exiba o widget da outra classe aqui
      case 1:
        return Teste();
      case 2:
        return Text('Conteúdo do item 3');
      case 3:
        return Text('Fiado');
      default:
        return Text('Conteúdo desconhecido');
    }
  }
}
