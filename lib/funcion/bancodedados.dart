import 'package:firedart/firedart.dart';
import 'package:genmerc/api/consumerProductor.dart';

class BdFiredart {
  String nome = ""; // nome variavel
  double subtotal = 0;
  double quantidade = 0;
  double valorUnit = 0; // valor unidade
  bool verificador = false;
  final Function(String) onSearchChanged;

  BdFiredart({required this.onSearchChanged});

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

  Future<void> addBancoFiredart(String cod) async {
    CollectionReference ref = Firestore.instance.collection('produtos');
    String teste = cod;
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
    if (listaDocument.isNotEmpty) {
      MyGetProductor getProdutosAPI = MyGetProductor();
      if (listaDocument.contains(teste)) {
        var produto = await getProdutosAPI.getProduct(teste);
        if (produto != null) {
          String productName =
              produto.productName ?? "Product name not available";
          var document = await ref.document(teste).get();
          int numberConvert = document['valorUnit'];
          double numm = numberConvert.toDouble();
          adicionar(productName, numm);
          onSearchChanged;
          print('${nome} ,${subtotal}, ${quantidade}, ${valorUnit}');
          //print("Product Name: $valor");
        } else {
          print("Product not found.");
        }
      } else {
        var produto = await getProdutosAPI.getProduct(teste);
        if (produto != null) {
          String productName =
              produto.productName ?? "Product name not available";

          ref.document(teste).create({'nome': productName, 'valorUnit': 5});
          var document = await ref.document(teste).get();
          int numberConvert = document['valorUnit'];
          double numm = numberConvert.toDouble();
          adicionar(productName, numm);
          onSearchChanged;
          print('${nome} ,${subtotal}, ${quantidade}, ${valorUnit}');
        } else {
          print("Product not found.");
        }
      }
    }
  }
}
