import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  List<String> frutas = [
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

  List<String> selectedFrutas = [];
  static String fruta = "";
  static double valor = 0;

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
    final filteredFrutas = frutas
        .where((fruta) => fruta.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredFrutas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredFrutas[index]),
          onTap: () {
            fruta = filteredFrutas[index];
            valor = numeros[index];
            close(context, 'Cancelar');
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredFrutas = frutas
        .where((fruta) => fruta.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredFrutas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredFrutas[index]),
          onTap: () {
            fruta = filteredFrutas[index];
            valor = numeros[index];
            close(context, 'Cancelar');
          },
        );
      },
    );
  }
}
