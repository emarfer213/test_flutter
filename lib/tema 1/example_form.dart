import 'package:flutter/material.dart';

//Nos creamos un enumerado para definir los radiobuttons
enum TheColors { red, blue }

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final _formKey = GlobalKey<FormState>();

  //1. Nos creamos el controllador del campo de entrada.
  TextEditingController textCtrl = TextEditingController();

  //Crear una variable para usarlla en groupValue
  TheColors _choice = TheColors.red;

  //CHECKBOX
  bool? _is_active = false;

  //Slider
  double _currentSliderValue = 0.0;

  //Range Slider
  RangeValues _currentRangeValues = RangeValues(20, 80);

  @override
  void initState() {
    super.initState();
    textCtrl.addListener(_printLatestValue); //3. Añadimos escuchas
  }

  @override
  void dispose() {
    super.dispose();
    textCtrl.dispose(); //4. Eliminar el controllador
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Insert your name',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value != "interface") {
                      return 'Try again!!';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    print(
                        "***************************************************************El valor del campo ha sido modificado a $value");
                  },
                  onSaved: (newValue) {
                    print(
                        'Este método se invoca cuando lanzo un save de formulario');
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.cabin)),
                  controller: textCtrl, //2. Asignamos al campo de entrada
                ),
                const SizedBox(
                  height: 30,
                ),
                Radio(
                  value: TheColors.red,
                  groupValue: _choice,
                  onChanged: (value) {
                    setState(() {
                      _choice = TheColors.red;
                    });
                  },
                ),
                Text("RED"),
                SizedBox(
                  height: 20,
                ),
                Radio(
                  value: TheColors.blue,
                  groupValue: _choice,
                  onChanged: (value) {
                    setState(() {
                      _choice = TheColors.blue;
                    });
                  },
                ),
                Text("BLUE"),
                SizedBox(
                  height: 20,
                ),
                Checkbox(
                  value: _is_active,
                  onChanged: (value) {
                    setState(() {
                      _is_active = value;
                    });
                  },
                ),
                Switch(
                  value: _is_active!,
                  onChanged: (value) {
                    setState(() {
                      _is_active = value;
                    });
                  },
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 10,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                      print("*********************** $value ************");
                    });
                  },
                ),
                RangeSlider(
                  min: 0,
                  max: 100,
                  divisions: 5,
                  labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString()),
                  values: _currentRangeValues,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("We are right!");
                        _formKey.currentState!.save();
                      }
                    },
                    child: const Text('TEST'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _printLatestValue() {
    print("Estamos haciendo uso de TEXTEDITINGCONTROLLER: ${textCtrl.text}");
  }
}
