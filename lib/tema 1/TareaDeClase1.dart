import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormularioPactricaExamen.dart';

void main() {
  runApp(TestLayout());
}

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: ListView(
          children: ListTile.divideTiles(
            color: Colors.grey,
            tiles: [
              campo(numero: "1"),
              campo(numero: "7"),
              campo(numero: "12"),
            ],
          ).toList(),
        ),
      ),
    );
  }
}

class campo extends StatelessWidget {
  const campo({super.key, required this.numero});

  final String numero;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(numero),
      trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        
      ),
    );
  }
}
