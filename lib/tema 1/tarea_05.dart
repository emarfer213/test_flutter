import 'package:flutter/material.dart';

void main() {
  runApp(TestLayout());
}

/**
 * definimos el widget raiz de la app
 * usamos para ello MaterialAPP
 */
class TestLayout extends StatelessWidget {
  const TestLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Layout", home: FirstScreen());
  }
}

/**
 * aqui definimos la interfaz/pantalla
 */
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tablero de juego tactico"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child : Expanded(
          child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.blue,
                          )
                        ],
                      )),
                  Expanded(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.blue,
                          )
                        ],
                      ))
                ],
              )
            ],
          )
      )
      ,
    )));
  }
}
