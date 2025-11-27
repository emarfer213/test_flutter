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
    return Scaffold(body:
    SafeArea(
        child: Column(
          children: [
            Expanded(
                child: GridView.count(
                    crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(
                    16,
                    (index) => Container(color: Colors.red,)
                ),
                )
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen())
              );
            }, child: Text("Next"))
          ],
        ),
    ));
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
    return GridView.extent(
      maxCrossAxisExtent: 250,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      children: List.generate(200, (index) => Container(color: Colors.green,)),
    );
  }
}
