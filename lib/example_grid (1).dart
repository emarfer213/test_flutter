import 'package:flutter/material.dart';

class ExampleGrid extends StatelessWidget {
  const ExampleGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double containerSize = 100;
    double factorFontSize = containerSize/10;

    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: containerSize,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        children: List.generate(
          100,
          (index) => Container(
            color: (index % 2 == 0) ? Colors.blue : Colors.amber,
            child: Text(index.toString(), style: TextStyle(fontSize: factorFontSize), textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }

  GridView buildGridViewBuilder() {
    return GridView.builder(
      itemCount: 24,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 5),
      itemBuilder: (context, index) {
        Color? backgroundColor = Colors.amber[500];

        if (index == 1 || index % 3 == 0 || (index + 1) % 3 == 0) {
          backgroundColor = Colors.green[500];
        }

        return Container(
          color: backgroundColor,
          child: Text(index.toString()),
        );
      },
    );
  }

  GridView buildGridViewCount() {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(
        12,
        (index) {
          Color? backgroundColor = Colors.red[500];
          if (index % 2 == 0) {
            backgroundColor = Colors.grey[800];
          }

          return Container(
            color: backgroundColor,
          );
        },
      ),
    );
  }
}
