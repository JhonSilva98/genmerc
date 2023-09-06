import 'package:flutter/material.dart';
import 'package:genmerc/api/consumerProductor.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  String texto = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (texto.length > 2) Image.network(texto),
              ElevatedButton(
                  onPressed: () async {
                    MyGetProductor getProdutos = MyGetProductor();
                    var produto = await getProdutos.getProduct("7898024394181");
                    setState(() {
                      if (produto != null) {
                        String productName =
                            produto.productName ?? "Product name not available";
                        texto = produto.imageFrontUrl ??
                            "Product name not available";
                        print("Product Name: $productName");
                        //print("Product Name: $valor");
                      } else {
                        print("Product not found.");
                      }
                    });

                    //print(test?.productName);
                  },
                  child: Text("testar"))
            ],
          ),
        ),
      ),
    );
  }
}
