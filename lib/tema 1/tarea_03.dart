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
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue.shade100,
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: double.maxFinite,
                            child: Image.network(
                              'https://fastly.picsum.photos/id/237/200/200.jpg?hmac=zHUGikXUDyLCCmvyww1izLK3R3k8oRYBRiTizZEdyfI',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.yellow,
                              child: Center(child: Text("info de usuario")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: double.maxFinite,
                      child: Image.network(
                        "https://fastly.picsum.photos/id/217/600/400.jpg?hmac=vGR4PIdK7u8t4ifvnJF0Qktz0lmTd1X4pZITAzAXSqQ",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Row(children: [
              Expanded(child: Container(
                color: Colors.redAccent,
                child: Center(child: Text("Boton 1"),),
              )),
              Expanded(child: Container(
                color: Colors.green,
                child: Center(child: Text("Boton 2"),),
              )),
              Expanded(child: Container(
                color: Colors.purple,
                child: Center(child: Text("Boton 3"),),
              )),
            ],)),
          ],
        ),
      ),
    );
  }
}
