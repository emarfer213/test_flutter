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
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 10, height: 10, color: Colors.black),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [point()],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [point()],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[400],
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [point(), point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [point(), point()],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[500],
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [point(), point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [point(), point()],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[600],
                    width: 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [point(), point(), point()],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [point(), point(), point()],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container point() {
    return Container(
      width: 10,
      height: 10,
      color: Colors.black,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    );
  }
}
