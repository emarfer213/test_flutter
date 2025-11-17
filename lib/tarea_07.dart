import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TestLayout());
}

/**
 * definimos el widget raiz de la app
 * usamos para ello MaterialAPP
 */
class TestLayout extends StatefulWidget {
  const TestLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }

  @override
  State<StatefulWidget> createState() => FirstScreen();
}

class FirstScreen extends State<StatefulWidget> {
  bool isGreen = false;
  bool isYellow = false;
  bool isBlue = false;
  bool isRed = false;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SecondScreen()
      },
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: Center(
            child: Text(
              "COLOR",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: isGreen,
                            onChanged: (value){
                              setState(() {
                                isGreen = value!;
                              });
                            }
                        ),
                        Text("Verde")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isYellow,
                            onChanged: (value){
                              setState(() {
                                isYellow = value!;
                              });
                            }
                        ),
                        Text("amarillo")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isBlue,
                            onChanged: (value){
                              setState(() {
                                isBlue = value!;
                              });
                            }
                        ),
                        Text("azul")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isRed,
                            onChanged: (value){
                              setState(() {
                                isRed = value!;
                              });
                            }
                        ),
                        Text("rojo")
                      ],
                    ),
                    ElevatedButton(
                        onPressed: (){
                          List<String> coloresElegidos = [];
                          if(isGreen){coloresElegidos.add("Verde");}
                          if(isYellow){coloresElegidos.add("Amarillo");}
                          if(isBlue){coloresElegidos.add("Azul");}
                          if(isRed){coloresElegidos.add("Rojo");}
                          Navigator.pushNamed(context, '/', arguments: coloresElegidos);
                        }, 
                        child: Text("Go"))
                  ],
                )
            )
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget{
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: Center(
            child: Text(
              "COLOR",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
          ),
        ),
        /*body: SafeArea(
            child: ListView.builder(),
      ),*/
    ));
  }
}