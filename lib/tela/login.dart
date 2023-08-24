import 'package:flutter/material.dart';
import 'package:genmerc/tela/telaInicial.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/fundo-login.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          Center(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF072d90),
                      Color(0xFF1a8f87),
                      Color(0Xff3eb66f)
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              label: Text(
                                "E-mail",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.alternate_email_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              label: Text(
                                "Senha",
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.key_outlined,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyTelaInicial()),
                            );
                          },
                          child: Text("LOGIN"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
