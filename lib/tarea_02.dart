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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(color: Colors.blue),
                              flex: 1,
                            ),
                            Expanded(
                              child: Container(color: Colors.green),
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: Container(color: Colors.yellow)),
                  ],
                ),
              ),
            ),
            Expanded(child: Container(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
