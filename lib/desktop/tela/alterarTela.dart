import 'package:flutter/material.dart';
import 'package:genmerc/desktop/tela/vender.dart';

class ContentDisplayWidget extends StatelessWidget {
  final int selectedIndex;

  const ContentDisplayWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const MyVender(); // Exiba o widget da outra classe aqui
      case 1:
        return const Text('data');
      case 2:
        return const Text('Conteúdo do item 3');
      case 3:
        return const Text('Fiado');
      default:
        return const Text('Conteúdo desconhecido');
    }
  }
}
