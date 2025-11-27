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
        child: Campo(),
      )
    );
  }
}

class Campo extends StatefulWidget {
  const Campo({super.key});

  @override
  State<Campo> createState() => _CampoState();
}

class _CampoState extends State<Campo> {
  int? _selectedIndex;
  bool _isRightToLeft = false;
  double _initialDx = 0.0;
  double _lastDx = 0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onHorizontalDragStart: (details) {
              _initialDx = details.localPosition.dx;
              _lastDx = _initialDx;
            },
            onHorizontalDragUpdate: (details) {
              _lastDx = details.localPosition.dx;
              _isRightToLeft = details.delta.dx < 0;
            },
            onHorizontalDragEnd: (details) {
              double distance = (_initialDx - _lastDx).abs();

              if (_isRightToLeft && distance > 100) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
            child: ListTile(
              tileColor: index == _selectedIndex
                  ? Colors.grey[200]
                  : Colors.transparent,
              title: Text(
                '$index',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}