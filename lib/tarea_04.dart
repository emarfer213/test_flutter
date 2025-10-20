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
    return Scaffold(body: SafeArea(child: listaPares()));
  }

  ListView listaPares() {
    return ListView.builder(
      itemCount: 100,
        itemBuilder: (context, index) {
      return Container(
        child: index % 2 == 0 ? Text("Elemento $index") : null,
      );
    });
  }
}
