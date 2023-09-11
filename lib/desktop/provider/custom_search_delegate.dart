import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genmerc/desktop/widgetPadrao/padrao.dart';

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
  List<double> valores = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];

  final Function(String) onSearchChanged;

  CustomSearchDelegate({required this.onSearchChanged});

  static String nome = ""; // nome variavel
  static double subtotal = 0;
  static double quantidade = 0;
  static double valorUnit = 0; // valor unidade
  static bool verificador = true;

  void adicionar(
    TextEditingController controller,
    String nomeindex,
    int pos,
    context,
  ) {
    verificador = true;
    nome = nomeindex;
    valorUnit = valores[pos];
    if (controller.text.isNotEmpty) {
      if (double.tryParse(controller.text)! <= 0) {
        quantidade = 1.0;
        subtotal = quantidade * valorUnit;
        controller.clear();
        Navigator.of(context).pop();
      } else {
        quantidade = double.tryParse(controller.text) ?? 1.0;
        subtotal = quantidade * valorUnit;
        controller.clear();
        Navigator.of(context).pop();
      }
    }
  }

  void cancelar(context) {
    verificador = false;
    Navigator.of(context).pop();
    onSearchChanged;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, 'Cancelar');
      },
      icon: const Icon(Icons.arrow_back),
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
            TextEditingController controller = TextEditingController(
              text: "1",
            );
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return RawKeyboardListener(
                  focusNode: FocusNode(),
                  autofocus: true,
                  onKey: (v) {
                    if (v.logicalKey == LogicalKeyboardKey.enter) {
                      adicionar(
                        controller,
                        filterednomes[index],
                        nomes.indexOf(filterednomes[index]),
                        context,
                      );
                    }
                  },
                  child: AlertDialog(
                    title: const Text('Adicione'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: controller,
                          onFieldSubmitted: (text) {
                            adicionar(
                              controller,
                              filterednomes[index],
                              nomes.indexOf(filterednomes[index]),
                              context,
                            );
                          },
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}$')),
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white, // Cor da borda branca
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .white, // Cor da borda branca quando focado
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              hintStyle:
                                  MyWidgetPadrao.myBeautifulTextStyleBlack),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Adicione a quantidade!',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          cancelar(context);
                        },
                        child: const Text(
                          'Fechar',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionar(
                            controller,
                            filterednomes[index],
                            nomes.indexOf(filterednomes[index]),
                            context,
                          );
                        },
                        child: const Text('Adicionar'),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
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
        .where(
          (nome) => nome.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: filterednomes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filterednomes[index]),
          onTap: () async {
            TextEditingController controller = TextEditingController(
              text: "1",
            );
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return RawKeyboardListener(
                  focusNode: FocusNode(),
                  autofocus: true,
                  onKey: (v) {
                    if (v.logicalKey == LogicalKeyboardKey.enter) {
                      adicionar(
                        controller,
                        filterednomes[index],
                        nomes.indexOf(filterednomes[index]),
                        context,
                      );
                    }
                  },
                  child: AlertDialog(
                    title: const Text('Adicione'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: controller,
                          onFieldSubmitted: (text) {
                            adicionar(
                              controller,
                              filterednomes[index],
                              nomes.indexOf(filterednomes[index]),
                              context,
                            );
                          },
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}$')),
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white, // Cor da borda branca
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .white, // Cor da borda branca quando focado
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              hintStyle:
                                  MyWidgetPadrao.myBeautifulTextStyleBlack),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Adicione a quantidade!',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          cancelar(context);
                        },
                        child: const Text(
                          'Fechar',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          adicionar(
                            controller,
                            filterednomes[index],
                            nomes.indexOf(filterednomes[index]),
                            context,
                          );
                        },
                        child: const Text('Adicionar'),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    backgroundColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
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
