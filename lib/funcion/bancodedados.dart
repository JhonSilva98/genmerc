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
  bool verificador = false;
  CollectionReference ref = Firestore.instance.collection('produtos');
  CollectionReference venda = Firestore.instance.collection('venda');

  void adicionar(
    String nomeindex,
    double valorIndex,
  ) {
    verificador = true;
    nome = nomeindex;
    valorUnit = valorIndex;
    quantidade = 1.0;
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
    String teste = cod;
    List<String> listNomesDocuments = await getListidDocuments();
//aqui vai fazer as verificaçoes se existe ou dados na API
    MyGetProductor getProdutosAPI = MyGetProductor();
    if (listNomesDocuments.isNotEmpty) {
      var produto = await getProdutosAPI.getProduct(teste);
      if (listNomesDocuments.contains(teste)) {
        print('Contem na lista');
        if (produto != null) {
          String productName =
              produto.productName ?? "Product name not available";
          var document = await ref.document(teste).get();
          var numberConvert = document['valorUnit'];
          double numm = numberConvert.toDouble();
          adicionar(productName, numm);
          venda.document(cod).create({
            'nome': productName,
            'valorUnit': numm,
          });
          print('${nome} ,${subtotal}, ${quantidade}, ${valorUnit}');
          //print("Product Name: $valor");
        } else {
          print("Product not found.");
        }
      } else if (produto == null) {
        print('NÃO TEM NEM NOME NEM NADA');
        double valorUnitario = 1;
        String nameProduto = "";
        TextEditingController controllerNome = TextEditingController();
        TextEditingController controllervalor = TextEditingController(
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
                    controller: controllerNome,
                    onFieldSubmitted: (text) {
                      nameProduto = controllerNome.text;
                    },
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
                  TextFormField(
                    controller: controllervalor,
                    onFieldSubmitted: (text) {
                      valorUnitario = double.tryParse(controllervalor.text)!;
                    },
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
                  onPressed: () {
                    nameProduto = controllerNome.text;
                    valorUnitario = double.parse(controllervalor.text);
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
        ref
            .document(teste)
            .create({'nome': nameProduto, 'valorUnit': valorUnitario});
        var document = await ref.document(teste).get();
        var numberConvert = document['valorUnit'];
        double numm = numberConvert.toDouble();
        adicionar(nameProduto, numm);
        venda.document(cod).create({
          'nome': nameProduto,
          'valorUnit': numm,
        });
        print('${nome} ,${subtotal}, ${quantidade}, ${valorUnit}');
      } else {
        print('não Contem na lista mas existe');
        var produto = await getProdutosAPI.getProduct(teste);
        if (produto != null) {
          String productName =
              produto.productName ?? "Product name not available";
          double valorUnitario = 1;
          TextEditingController controller = TextEditingController(
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
                      controller: controller,
                      onFieldSubmitted: (text) {
                        valorUnitario = double.tryParse(controller.text)!;
                      },
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
                    onPressed: () {
                      valorUnitario = double.tryParse(controller.text)!;
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
          ref
              .document(teste)
              .create({'nome': productName, 'valorUnit': valorUnitario});
          var document = await ref.document(teste).get();
          var numberConvert = document['valorUnit'];
          double numm = numberConvert.toDouble();
          adicionar(productName, numm);
          venda.document(cod).create({
            'nome': productName,
            'valorUnit': numm,
          });
          print('${nome} ,${subtotal}, ${quantidade}, ${valorUnit}');
        } else {
          print("Product not found.");
        }
      }
    }
  }
}
