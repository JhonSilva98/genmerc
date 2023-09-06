import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genmerc/funcion/addDataTable.dart';
import 'package:genmerc/desktop/provider/custom_search_delegate.dart';
import 'package:genmerc/desktop/widgetPadrao/padrao.dart';
import 'package:genmerc/funcion/bancodedados.dart';

class MyVender extends StatefulWidget {
  const MyVender({super.key});

  @override
  State<MyVender> createState() => _MyVenderState();
}

class _MyVenderState extends State<MyVender> {
  List<DataRow> dataRowsFinal = [];
  List<List<dynamic>> variaveisApagar = [];

  double subtotal = 0.0;
  double troco = 0;
  double quantidade = 0;
  double valorUnit = 0;

  TextEditingController _valorpago = TextEditingController(text: '0.0');

  void _onsubmited(PointerDownEvent event) {
    if (_valorpago.text.isNotEmpty) {
      if (double.tryParse(_valorpago.text)! >= subtotal) {
        String num = _valorpago.text.replaceAll(',', '.');
        double numDouble = double.parse(num);
        double resul = numDouble - subtotal;
        if (resul >= 0) {
          setState(() {
            troco = resul;
          });
        }
      } else {
        setState(
          () {
            _valorpago.text = '0.0';
            troco = 0.0;
          },
        );
      }
    } else {
      setState(
        () {
          _valorpago.text = '0.0';
          troco = 0.0;
        },
      );
    }
  }

  void _updateSearch(String newSearch) {
    setState(() {});
  }

  void funcionClean() {
    setState(() {
      dataRowsFinal.clear();
      CustomSearchDelegate.nome = "";
      CustomSearchDelegate.valorUnit = 0;
      CustomSearchDelegate.quantidade = 0;
      CustomSearchDelegate.subtotal = 0;
      CustomSearchDelegate.verificador = false;
      subtotal = 0.0;
      troco = 0;
      quantidade = 0;
      valorUnit = 0;
      _valorpago.text = '0.0';
      variaveisApagar.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              iconSize: 50.0,
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    onSearchChanged: _updateSearch,
                  ),
                );
                MyAddTABLE tabela = MyAddTABLE(
                  CustomSearchDelegate.nome,
                  CustomSearchDelegate.valorUnit,
                  CustomSearchDelegate.quantidade,
                  CustomSearchDelegate.subtotal,
                );
                if (CustomSearchDelegate.verificador) {
                  tabela.adicionarItem();
                  setState(
                    () {
                      tabela.adicionarItem();
                      dataRowsFinal.add(tabela.rows!);
                      variaveisApagar.add([
                        "${CustomSearchDelegate.nome}",
                        false,
                        CustomSearchDelegate.subtotal
                      ]);
                      quantidade = CustomSearchDelegate.quantidade;
                      subtotal += CustomSearchDelegate.subtotal;
                      if (double.parse(_valorpago.text) >= subtotal) {
                        setState(
                          () {
                            troco = double.parse(_valorpago.text) - subtotal;
                          },
                        );
                      } else {
                        setState(
                          () {
                            _valorpago.text = "0.0";
                            troco = 0.0;
                          },
                        );
                      }
                    },
                  );
                }
              },
              icon: Center(
                child: const Icon(
                  Icons.search_outlined,
                ),
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(196, 83, 122, 169),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      'Cod',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF002b51),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Nome',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF002b51),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'V. Unit.',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF002b51),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Qtd',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF002b51),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF002b51),
                                      ),
                                    ),
                                  ),
                                ],
                                rows: dataRowsFinal,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: 10,
                                  color: Color(0XFF002b51),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Valor",
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 10,
                                  color: Color(0XFF002b51),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "$subtotal",
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Card(
                              elevation: 10,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Color(0XFF002b51),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                        size: 100,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2, 2),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Subtotal:",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text("$subtotal",
                                                style: MyWidgetPadrao
                                                    .myBeautifulTextStyle),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Opacity(
                                        opacity: 0.1,
                                        child: Icon(
                                          Icons.stairs_rounded,
                                          size: 100,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Card(
                              elevation: 10,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Color(0XFF002b51),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                        size: 100,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2, 2),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Valor Pago:",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: TextFormField(
                                              controller: _valorpago,
                                              textAlign: TextAlign.center,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                        r'^\d+\.?\d{0,2}$')),
                                              ],
                                              onTapOutside: _onsubmited,
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                decimal: true,
                                              ),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .white, // Cor da borda branca
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .white, // Cor da borda branca quando focado
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8.0),
                                                    ),
                                                  ),
                                                  hintStyle: MyWidgetPadrao
                                                      .myBeautifulTextStyle),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Opacity(
                                        opacity: 0.1,
                                        child: Icon(
                                          Icons.money,
                                          size: 100,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Card(
                              elevation: 10,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(176, 13, 161, 0),
                                      Color.fromARGB(193, 13, 192, 88)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                        size: 100,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2, 2),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Troco:",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text("$troco",
                                                style: MyWidgetPadrao
                                                    .myBeautifulTextStyle),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Opacity(
                                        opacity: 0.1,
                                        child: Icon(
                                          Icons.expand_circle_down_outlined,
                                          size: 100,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Selecione'),
                                            content: StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return Container(
                                                width: double.maxFinite,
                                                child: ListView.builder(
                                                    itemCount:
                                                        variaveisApagar.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return CheckboxListTile(
                                                        title: Text(
                                                            "${variaveisApagar[index][0]}"),
                                                        value: variaveisApagar[
                                                            index][1]!,
                                                        onChanged: (bool) {
                                                          setState(() {
                                                            variaveisApagar[
                                                                    index][1] =
                                                                bool!;
                                                          });
                                                        },
                                                      );
                                                    }),
                                              );
                                            }),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Fechar',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      List<int>
                                                          indicesToRemove = [];
                                                      for (var number
                                                          in variaveisApagar) {
                                                        if (number[1] == true) {
                                                          indicesToRemove.add(
                                                              variaveisApagar
                                                                  .indexOf(
                                                                      number));
                                                        }
                                                      }

                                                      for (var index
                                                          in indicesToRemove
                                                              .reversed) {
                                                        subtotal -=
                                                            variaveisApagar[
                                                                index][2];
                                                        dataRowsFinal
                                                            .removeAt(index);
                                                        variaveisApagar
                                                            .removeAt(index);
                                                      }
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                                child: Text('Apagar'),
                                              ),
                                            ],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 5,
                                            backgroundColor: Colors.white,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Apagar",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      BdFiredart dados = BdFiredart();
                                      await dados.addBancoFiredart(
                                          '7894321722016', context);
                                      MyAddTABLE tabela = MyAddTABLE(
                                        dados.nome,
                                        dados.valorUnit,
                                        dados.quantidade,
                                        dados.subtotal,
                                      );
                                      if (dados.verificador) {
                                        tabela.adicionarItem();
                                        setState(() {
                                          dataRowsFinal.add(tabela.rows!);
                                          variaveisApagar.add([
                                            "${dados.nome}",
                                            false,
                                            dados.subtotal
                                          ]);
                                          quantidade = dados.quantidade;
                                          subtotal += dados.subtotal;
                                          if (double.parse(_valorpago.text) >=
                                              subtotal) {
                                            setState(
                                              () {
                                                troco = double.parse(
                                                        _valorpago.text) -
                                                    subtotal;
                                              },
                                            );
                                          } else {
                                            setState(
                                              () {
                                                _valorpago.text = "0.0";
                                                troco = 0.0;
                                              },
                                            );
                                          }
                                        });
                                      }
                                      //funcionClean();
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.blue[900]),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Finalizar",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: Icon(Icons.check),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
