import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  List<String> nomes = [
    'Maçã',
    'Banana',
    'Laranja',
    'Morango',
    'Uva',
    'Pêssego',
    'Abacaxi',
    'Kiwi',
    'Manga',
    'Melancia',
  ];
  List<double> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final Function(String) onSearchChanged;

  CustomSearchDelegate({required this.onSearchChanged});

  static String nome = "";
  static double valor = 0;
  static double quantidade = 0;
  static double valorUnit = 0;
  static bool verificador = true;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, 'Cancelar');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filterednomes = nomes
        .where((nome) => nome.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filterednomes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filterednomes[index]),
          onTap: () async {
            TextEditingController _controller =
                TextEditingController(text: "1");
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alterar quantidade'),
                  content: TextField(
                    controller: _controller,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}$')),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        verificador = false;
                        Navigator.of(context).pop();
                        onSearchChanged;
                      },
                    ),
                    TextButton(
                      child: Text('Salvar'),
                      onPressed: () {
                        verificador = true;
                        nome = filterednomes[index];
                        valorUnit = numeros[index];
                        if (_controller.text.isNotEmpty) {
                          if (double.tryParse(_controller.text)! <= 0) {
                            quantidade = 1.0;
                            valor = quantidade * valorUnit;
                            _controller.clear();
                            Navigator.of(context).pop();
                          } else {
                            quantidade =
                                double.tryParse(_controller.text) ?? 1.0;
                            valor = quantidade * valorUnit;
                            _controller.clear();
                            Navigator.of(context).pop();
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            );
            onSearchChanged;
            close(context, 'Cancelar');
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filterednomes = nomes
        .where((nome) => nome.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filterednomes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filterednomes[index]),
          onTap: () async {
            TextEditingController _controller =
                TextEditingController(text: "1");
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alterar quantidade'),
                  content: TextField(
                    controller: _controller,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}$')),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        verificador = false;
                        Navigator.of(context).pop();
                        onSearchChanged;
                      },
                    ),
                    TextButton(
                      child: Text('Salvar'),
                      onPressed: () {
                        verificador = true;
                        nome = filterednomes[index];
                        valorUnit = numeros[index];
                        if (_controller.text.isNotEmpty) {
                          if (double.tryParse(_controller.text)! <= 0) {
                            quantidade = 1.0;
                            valor = quantidade * valorUnit;
                            Navigator.of(context).pop();
                          } else {
                            quantidade =
                                double.tryParse(_controller.text) ?? 1.0;
                            valor = quantidade * valorUnit;
                            Navigator.of(context).pop();
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            );
            onSearchChanged;
            close(context, 'Cancelar');
          },
        );
      },
    );
  }
}
