import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TestLayout());
}

enum UserRole { admin, user, guest }

class TestLayout extends StatelessWidget {
  const TestLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Layout", home: FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sharing opportunities"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          backgroundColor: Colors.teal[700],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(labelText: "username"),
                    validator: (value) {
                      validator:
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, introduce el nombre de usuario";
                        }
                        return null;
                      };
                    },
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, introduce la contraseña";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isActive = false;
  bool flutterChecked = false;
  bool androidChecked = false;
  bool iOSChecked = false;
  RangeValues salaryRange = RangeValues(10, 20);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sharing opportunities"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          backgroundColor: Colors.teal[700],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "job title"),
                    validator: (value) {
                      validator:
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, introduce el nombre de usuario";
                        }
                        return null;
                      };
                    },
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Activar opción", style: TextStyle(fontSize: 18)),
                      CupertinoSwitch(
                        value: _isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Center(child: Text("Codding experience in")),
                      SizedBox(height: 15),
                      _buildCheckboxRow("Flutter", flutterChecked, (newValue) {
                        setState(() => flutterChecked = newValue ?? false);
                      }),
                      _buildCheckboxRow("Android", androidChecked, (newValue) {
                        setState(() => androidChecked = newValue ?? false);
                      }),
                      _buildCheckboxRow("iOS", iOSChecked, (newValue) {
                        setState(() => iOSChecked = newValue ?? false);
                      }),
                    ],
                  ),
                  Divider(height: 30,),
                  Text("Salary", style: TextStyle(fontWeight: FontWeight.bold)),
                  RangeSlider(
                    values: salaryRange,
                    min: 10,
                    max: 100,
                    divisions: 9,
                    labels: RangeLabels(
                      '${salaryRange.start.round()}k',
                      '${salaryRange.end.round()}k',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        salaryRange = values;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                  SizedBox(height: 40),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => terceraPantalla(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[600],
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      ),
                      child: Text(
                        "Ver Detalles",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class terceraPantalla extends StatefulWidget {
  const terceraPantalla({super.key});

  @override
  State<terceraPantalla> createState() => ThirdScreenState();
}

class ThirdScreenState extends State<terceraPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sharing opportunities"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        backgroundColor: Colors.teal[700],
      ),
    );
  }
}

Widget _buildCheckboxRow(
  String title,
  bool value,
  ValueChanged<bool?> onChanged,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(title),
      Checkbox(value: value, onChanged: onChanged, activeColor: Colors.teal),
    ],
  );
}
