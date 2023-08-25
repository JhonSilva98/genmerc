import 'package:flutter/material.dart';

class MyVender extends StatefulWidget {
  const MyVender({super.key});

  @override
  State<MyVender> createState() => _MyVenderState();
}

class _MyVenderState extends State<MyVender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey), // Cor da borda
                              borderRadius: BorderRadius.all(Radius.circular(
                                  50.0)), // Raio do canto da borda
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .blue), // Cor da borda quando focado
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            hintText: 'Buscar'),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        splashColor: Colors.blue,
                        color: Colors.blue,
                        iconSize: 50,
                        icon: Icon(
                          Icons.add_business,
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
                            color: Color.fromARGB(255, 158, 158, 158)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: [
                                    DataColumn(label: Text('Posição')),
                                    DataColumn(label: Text('Codigo')),
                                    DataColumn(label: Text('Nome')),
                                    DataColumn(label: Text('Valor Un.')),
                                    DataColumn(label: Text('Quantidade')),
                                    DataColumn(label: Text('Total')),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Maria')),
                                      DataCell(Text('30')),
                                      DataCell(Text('Rio de Janeiro')),
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Carlos')),
                                      DataCell(Text('22')),
                                      DataCell(Text('Belo Horizonte')),
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Maria')),
                                      DataCell(Text('30')),
                                      DataCell(Text('Rio de Janeiro')),
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(Text('Carlos')),
                                      DataCell(Text('22')),
                                      DataCell(Text('Belo Horizonte')),
                                      DataCell(Text('João')),
                                      DataCell(Text('25')),
                                      DataCell(Text('São Paulo')),
                                    ]),

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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "RS: 10,50",
                                      softWrap: false,
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
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
                            color: Color.fromARGB(151, 158, 158, 158),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Card(
                                    elevation: 10,
                                    child: ListTile(
                                      leading: Icon(Icons.attach_money),
                                      title: Text(
                                        "Subtotal:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Center(
                                        child: Flexible(
                                          child: Text(
                                            "RS: 10,00",
                                            style: TextStyle(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold),
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
                                    child: ListTile(
                                      leading: Icon(Icons.attach_money),
                                      title: Text(
                                        "Valor pago:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Center(
                                        child: Flexible(
                                          child: Text(
                                            "RS: 10,00",
                                            style: TextStyle(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold),
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
                                    child: ListTile(
                                      leading: Icon(Icons.attach_money),
                                      title: Text(
                                        "Troco:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Center(
                                        child: Flexible(
                                          child: Text(
                                            "RS: 10,00",
                                            style: TextStyle(
                                                fontSize: 50,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                        onPressed: () {},
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
