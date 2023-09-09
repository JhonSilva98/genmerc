import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genmerc/api/consumerProductor.dart';
import 'package:genmerc/desktop/widgetPadrao/padrao.dart';

class BdFiredart {
  String nome = ""; // nome variavel
  double subtotal = 0;
  double quantidade = 0;
  double valorUnit = 0; // valor unidade
  CollectionReference ref = Firestore.instance.collection('produtos');
  CollectionReference venda = Firestore.instance.collection('venda');

  void adicionar(String nomeindex, double unidade, double qtt) {
    nome = nomeindex;
    valorUnit = unidade;
    quantidade = qtt;
    subtotal = quantidade * valorUnit;
  }

  Future<void> cleanBDVenda() async {
    //await venda.
  }

  Future<List<String>> getListidDocumentsVenda() async {
    List<String> listaDocument = [];
    var document = await venda.get();
    for (var doc in document) {
      // Use uma expressão regular para encontrar o número
      RegExp regex = RegExp(r'(\d+)');
      Match? match = regex.firstMatch(doc.toString());
      if (match != null) {
        String numero = match.group(0)!;
        listaDocument.add(numero);
      } else {
        print("Número não encontrado na string.");
      }
    }
    return listaDocument;
  }

  Future<List<String>> getListidDocuments() async {
    List<String> listaDocument = [];
    var document = await ref.get();
    for (var doc in document) {
      // Use uma expressão regular para encontrar o número
      RegExp regex = RegExp(r'(\d+)');
      Match? match = regex.firstMatch(doc.toString());
      if (match != null) {
        String numero = match.group(0)!;
        listaDocument.add(numero);
        print(numero);
      } else {
        print("Número não encontrado na string.");
      }
    }
    return listaDocument;
  }

  Future<void> addBancoFiredart(String cod, context) async {
//aqui vai pegar os nomes dos documentos
    List<String> listNomesDocuments = await getListidDocuments();
    List<String> listNomesDocumentsVenda = await getListidDocumentsVenda();
//aqui vai fazer as verificaçoes se existe ou dados na API
    MyGetProductor getProdutosAPI = MyGetProductor();

    if (!listNomesDocumentsVenda.contains(cod)) {
      var produto = await getProdutosAPI.getProduct(cod);
      if (produto != null) {
        if (listNomesDocuments.contains(cod)) {
          print('Contem na lista');
          var document = await ref.document(cod).get();
          String productName = document['nome'];
          var numberConvert = document['valorUnit'];
          double numm = numberConvert.toDouble();
          TextEditingController _controllerQTD = TextEditingController(
            text: "1",
          );
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Adicione'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _controllerQTD,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[\d,]+(\.\d{0,2})?$'),
                        ),
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Digite a quantidade do produto:',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Cor da borda branca
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .white, // Cor da borda branca quando focado
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintStyle: MyWidgetPadrao.myBeautifulTextStyleBlack),
                    ),
                    Text(
                      'Adicione a quantidade!',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Fechar',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_controllerQTD.text.isNotEmpty) {
                        _controllerQTD.text =
                            _controllerQTD.text.replaceAll(',', '.');
                        double sub = double.parse(_controllerQTD.text) * numm;
                        await venda.document(cod).create({
                          'cod': cod,
                          'nome': productName,
                          'valorUnit': numm,
                          'quantidade': double.parse(_controllerQTD.text),
                          'subtotal': sub
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              );
            },
          );
        } else {
          print('NÃO TEM NEM NOME NEM NADA mas tem na API');

          TextEditingController controllervalor = TextEditingController();
          TextEditingController controllerQTD = TextEditingController(
            text: "1",
          );
          String? nome = produto.productName;
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Adicione'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: controllervalor,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^[\d,]+(\.\d{0,2})?$'),
                          ),
                        ],
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            labelText: 'Digite o valor do produto:',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, // Cor da borda branca
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
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
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: TextFormField(
                        controller: controllerQTD,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^[\d,]+(\.\d{0,2})?$'),
                          ),
                        ],
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            labelText: 'Digite a quantidade do produto:',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, // Cor da borda branca
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
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
                    ),
                    Text(
                      'Adicione os dados inexistentes',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Fechar',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (controllervalor.text.isNotEmpty &&
                          controllerQTD.text.isNotEmpty) {
                        controllervalor.text =
                            controllervalor.text.replaceAll(',', '.');
                        controllerQTD.text =
                            controllerQTD.text.replaceAll(',', '.');
                        String newNome = nome!;
                        ref.document(cod).create({
                          'cod': cod,
                          'nome': newNome,
                          'valorUnit': double.parse(controllervalor.text),
                        });
                        double sub = double.parse(controllervalor.text) *
                            double.parse(controllerQTD.text);
                        venda.document(cod).create({
                          'cod': cod,
                          'nome': newNome,
                          'valorUnit': double.parse(controllervalor.text),
                          'quantidade': double.parse(controllerQTD.text),
                          'subtotal': sub
                        });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              );
            },
          );
        }
      } else {
        print('NÃO TEM NEM NOME NEM NADA');

        TextEditingController controllerNome = TextEditingController();
        TextEditingController controllervalor = TextEditingController();
        TextEditingController controllerQTD = TextEditingController(
          text: "1",
        );
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Adicione'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: controllerNome,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Digite o nome do produto',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Cor da borda branca
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .white, // Cor da borda branca quando focado
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintStyle: MyWidgetPadrao.myBeautifulTextStyleBlack),
                    ),
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    child: TextFormField(
                      controller: controllervalor,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[\d,]+(\.\d{0,2})?$'),
                        ),
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Digite o valor do produto:',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Cor da borda branca
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .white, // Cor da borda branca quando focado
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintStyle: MyWidgetPadrao.myBeautifulTextStyleBlack),
                    ),
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    child: TextFormField(
                      controller: controllerQTD,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[\d,]+(\.\d{0,2})?$'),
                        ),
                      ],
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Digite a quantidade do produto:',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Cor da borda branca
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors
                                  .white, // Cor da borda branca quando focado
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintStyle: MyWidgetPadrao.myBeautifulTextStyleBlack),
                    ),
                  ),
                  Text(
                    'Adicione os dados inexistentes',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Fechar',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (controllerNome.text.isNotEmpty &&
                        controllervalor.text.isNotEmpty &&
                        controllerQTD.text.isNotEmpty) {
                      controllervalor.text =
                          controllervalor.text.replaceAll(',', '.');
                      controllerQTD.text =
                          controllerQTD.text.replaceAll(',', '.');

                      ref.document(cod).create({
                        'cod': cod,
                        'nome': controllerNome.text,
                        'valorUnit': double.parse(controllervalor.text),
                      });
                      double sub = double.parse(controllervalor.text) *
                          double.parse(controllerQTD.text);
                      venda.document(cod).create({
                        'cod': cod,
                        'nome': controllerNome.text,
                        'valorUnit': double.parse(controllervalor.text),
                        'quantidade': double.parse(controllerQTD.text),
                        'subtotal': sub
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            );
          },
        );
      }
    } else {
      TextEditingController _controllerQTD = TextEditingController(
        text: "1",
      );
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Adicione'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: _controllerQTD,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}$')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Digite a quantidade do produto:',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // Cor da borda branca
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors
                                .white, // Cor da borda branca quando focado
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        hintStyle: MyWidgetPadrao.myBeautifulTextStyleBlack),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Esse item ja existe altere a quantidade!',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Fechar',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_controllerQTD.text.isNotEmpty) {
                    _controllerQTD.text =
                        _controllerQTD.text.replaceAll(',', '.');

                    double newQTD = double.tryParse(_controllerQTD.text) ?? 1.0;
                    var doc = await venda.document(cod).get();
                    var numberConvert = doc['valorUnit'];
                    double numm = numberConvert.toDouble();
                    double sub = newQTD * numm;
                    await venda.document(cod).update({
                      'quantidade': newQTD,
                      'subtotal': sub,
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Adicionar'),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          );
        },
      );
    }
  }
}
