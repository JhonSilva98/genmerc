import 'package:flutter/material.dart';
import 'package:genmerc/widgetPadrao/padrao.dart';

class MyVender extends StatefulWidget {
  const MyVender({super.key});

  @override
  State<MyVender> createState() => _MyVenderState();
}

class _MyVenderState extends State<MyVender> {
  MyWidgetPadrao styleText = MyWidgetPadrao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0XFF5379a9),
          /*gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 45, 102),
              Color.fromARGB(186, 7, 223, 230),
            ],
          ),*/
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
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
                          hintText: 'Buscar',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        splashColor: Colors.blue,
                        color: Colors.blue,
                        iconSize: 50,
                        icon: Icon(
                          Icons.add_business,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0, left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(230, 158, 158, 158)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'Posição',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Codigo',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Nome',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Valor Un.',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Quantidade',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Total',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                  rows: [
                                    styleText.myDataRow,
                                    styleText.myDataRow,
                                    styleText.myDataRow,
                                    styleText.myDataRow,
                                    styleText.myDataRow,
                                    styleText.myDataRow,
                                    // Adicione mais linhas conforme necessário
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Valor",
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "10,50",
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 248, 31, 16)),
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
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(131, 33, 149, 243),
                                            Color.fromARGB(113, 155, 39, 176)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: ListTile(
                                        leading: FittedBox(
                                          fit: BoxFit.cover,
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
                                        title: Text(
                                          "Subtotal:",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          "RS: 10,00",
                                          style: styleText.myBeautifulTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(131, 102, 92, 92),
                                            Color.fromARGB(122, 156, 156, 156)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: ListTile(
                                        leading: FittedBox(
                                          fit: BoxFit.cover,
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
                                        title: Text(
                                          "Valor pago:",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          "RS: 10,00",
                                          style: styleText.myBeautifulTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(131, 40, 241, 22),
                                            Color.fromARGB(132, 13, 192, 22)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: ListTile(
                                        leading: FittedBox(
                                          fit: BoxFit.cover,
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
                                        title: Text(
                                          "Troco:",
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          "RS: 10,00",
                                          style: styleText.myBeautifulTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.blue),
                                        ),
                                        child: Text(
                                          "Finalizar",
                                          style: TextStyle(fontSize: 50),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
