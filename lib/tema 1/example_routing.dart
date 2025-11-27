import 'package:flutter/material.dart';

class ExampleRouting extends StatelessWidget {
  const ExampleRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
        child: TextButton(child: const Text('GO'), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AnotherScreen();
          },));
        },),
      ),
    );
  }
}

// ESTO DEBERÍA ESTAR EN OTRO ARCHIVO
class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Center(
        child: TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('BACK')),
      ),
    );
  }
}

