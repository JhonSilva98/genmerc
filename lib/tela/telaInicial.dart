import 'package:flutter/material.dart';
import 'package:genmerc/funcion/alterarTela.dart';

class MyTelaInicial extends StatefulWidget {
  const MyTelaInicial({super.key});

  @override
  State<MyTelaInicial> createState() => _MyTelaInicialState();
}

class _MyTelaInicialState extends State<MyTelaInicial> {
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: <Widget>[
        NavigationRail(
          elevation: 10,
          selectedIndex: _selectedIndexNotifier.value,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndexNotifier.value = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.store),
              selectedIcon: Icon(Icons.store_mall_directory_outlined),
              label: Text('Vender'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.attach_money),
              selectedIcon: Icon(Icons.attach_money_rounded),
              label: Text('Carteira'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.edit_note_rounded),
              selectedIcon: Icon(Icons.edit_document),
              label: Text('Editar'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: ContentDisplayWidget(
              selectedIndex: _selectedIndexNotifier.value,
            ),
          ),
        ),
      ],
    ));
  }
}
