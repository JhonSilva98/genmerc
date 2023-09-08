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
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 10),
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
                      _controllerQTD.text =
                          _controllerQTD.text.replaceAll(',', '.');
                      adicionar(
                          productName, numm, double.parse(_controllerQTD.text));
                      await venda.document(cod).create({
                        'cod': cod,
                        'nome': productName,
                        'valorUnit': numm,
                        'quantidade': double.parse(_controllerQTD.text),
                        'subtotal': subtotal
                      });
                      Navigator.of(context).pop();
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
                mainAxisSize: MainAxisSize.min,
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
                    controllervalor.text =
                        controllervalor.text.replaceAll(',', '.');
                    controllerQTD.text =
                        controllervalor.text.replaceAll(',', '.');
                    adicionar(
                        controllerNome.text,
                        double.parse(controllervalor.text),
                        double.parse(controllerQTD.text));
                    ref.document(cod).create({
                      'cod': cod,
                      'nome': nome,
                      'valorUnit': valorUnit,
                      'quantidade': quantidade,
                      'subtotal': subtotal
                    });
                    venda.document(cod).create({
                      'cod': cod,
                      'nome': nome,
                      'valorUnit': valorUnit,
                      'quantidade': quantidade,
                      'subtotal': subtotal
                    });
                    Navigator.of(context).pop();
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
              mainAxisSize: MainAxisSize.min,
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
                  'Ess item ja exixte altere a quantidade!',
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
                  Navigator.of(context).pop();
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
      _controllerQTD.text = _controllerQTD.text.replaceAll(',', '.');

      double newQTD = double.tryParse(_controllerQTD.text) ?? 1.0;
      venda.document(cod).set({
        'quantidade': newQTD,
      });
    }
  }
}
