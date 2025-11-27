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

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: campo(nombre: '',),
      )
    );
  }
}

class campo extends StatelessWidget {
  const campo({super.key, required this.nombre});
  final String nombre;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 5,
          itemBuilder: (context, index){
          return GestureDetector(

          );
          }
      ),
    );
  }
}