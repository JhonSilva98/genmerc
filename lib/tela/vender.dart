import 'package:flutter/material.dart';
import 'package:genmerc/funcion/addDataTable.dart';
import 'package:genmerc/widgetPadrao/padrao.dart';

class MyVender extends StatefulWidget {
  const MyVender({super.key});

  @override
  State<MyVender> createState() => _MyVenderState();
}

class _MyVenderState extends State<MyVender> {
  MyWidgetPadrao styleText = MyWidgetPadrao();
  List<DataRow> dataRows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(196, 83, 122, 169),
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
                      child: TextFormField(
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
                        onPressed: () {
                          MyAddTABLE tabela = MyAddTABLE();
                          tabela.adicionarItem();
                          setState(() {
                            dataRows.add(tabela.table!);
                          });
                        },
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
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Center(
                                  child: DataTable(
                                    columns: [
                                      DataColumn(
                                        label: Flexible(
                                          child: Text(
                                            'Pos',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0XFF002b51),
                                            ),
                                          ),
                                        ),
                                      ),
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
                                        label: Flexible(
                                          child: Text(
                                            'V. Unit.',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0XFF002b51),
                                            ),
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
                                        label: Flexible(
                                          child: Text(
                                            'Total',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0XFF002b51),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: dataRows,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 10,
                                      color: Color(0XFF002b51),
                                      child: Center(
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
                                  Expanded(
                                    child: Card(
                                      elevation: 10,
                                      color: Color(0XFF002b51),
                                      child: Center(
                                        child: Text(
                                          "10,50",
                                          softWrap: false,
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
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
                                        color: Color(0XFF002b51),
                                        /*gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(131, 33, 149, 243),
                                            Color.fromARGB(113, 155, 39, 176)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),*/
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: ListTile(
                                        leading: FittedBox(
                                          fit: BoxFit.scaleDown,
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
                                        title: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "Subtotal:",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        subtitle: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "10,00",
                                            style:
                                                styleText.myBeautifulTextStyle,
                                          ),
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
                                        color: Color(0XFF002b51),
                                        /*gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(131, 102, 92, 92),
                                            Color.fromARGB(122, 156, 156, 156)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),*/
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
                                        title: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "Valor pago:",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 100.0, left: 100.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors
                                                      .white, // Cor da borda branca
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
                                              hintStyle: TextStyle(
                                                fontSize: 50,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
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
                                          fit: BoxFit.scaleDown,
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
                                        title: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "Troco:",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        subtitle: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "10,00",
                                            style:
                                                styleText.myBeautifulTextStyle,
                                          ),
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
                                                  Colors.blue[900]),
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