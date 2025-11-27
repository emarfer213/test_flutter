import 'package:flutter/material.dart';


void main() {
  runApp(const ExampleFormField());
}

enum UserRole { admin, user, guest }

class ExampleFormField extends StatefulWidget {
  const ExampleFormField({super.key});

  @override
  State<ExampleFormField> createState() => _ExampleFormFieldState();
}

class _ExampleFormFieldState extends State<ExampleFormField> {
  // 1. La clave GlobalKey para el Form (esto no cambia)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // 2. El widget Form (esto no cambia)
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey, // 3. Asignamos la clave (esto no cambia)
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- CAMPO 1: TextFormField (como antes) ---
              TextFormField(
                validator: (value) {
                  String? result = null;
                  if (value == null || value.isEmpty) {
                    result =  'Este campo no puede estar vacío';
                  }else if (value.length <= 2){
                    result =   'Este campo debe ser mayor de dos caracteres';
                  }
                  return result; // Es válido if retorna null
                },
                decoration: const InputDecoration(
                  labelText: 'Nombre', // 'label' es mejor que 'hint'
                  hintText: 'Escribe tu nombre',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24), // Un poco más de espacio

              // --- CAMPO 2: FormField genérico para un Dropdown ---
              FormField<UserRole>(
                initialValue: UserRole.user,
                // 4. El validador comprueba si el valor es nulo
                // (nulo = "Seleccione un rol" está elegido)
                validator: (value) {
                  if (value == UserRole.user) {
                    return 'Por favor, seleccione un rol diferente a USUARIO';
                  }
                  return null; // Es válido
                },

                // 5. El builder dibuja el dropdown Y el error
                builder: (FormFieldState<UserRole> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Usamos un DropdownButton normal
                      DropdownButton<UserRole>(
                        // El 'value' es el valor actual del state
                        value: state.value,
                        isExpanded: true, // Ocupa todo el ancho
                        hint: const Text('Seleccione un rol'),

                        // 6. ¡CRÍTICO! Informamos al FormField
                        // que su valor ha cambiado.
                        onChanged: (UserRole? newValue) {
                          state.didChange(newValue);
                        },

                        // Opciones del dropdown
                        items: const [
                          DropdownMenuItem<UserRole>(
                            value: UserRole.admin,
                            child: Text('Administrador'),
                          ),
                          DropdownMenuItem<UserRole>(
                            value: UserRole.user,
                            child: Text('Usuario'),
                          ),
                          DropdownMenuItem<UserRole>(
                            value: UserRole.guest,
                            child: Text('Invitado'),
                          ),
                        ],
                      ),

                      // 7. Mostramos el error si existe
                      // (Lo ponemos manualmente porque el Dropdown
                      // no tiene una propiedad 'errorText' como el TextField)
                      if (state.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                          child: Text(
                            state.errorText!,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              //CAMPO 3
              // 8. El botón ahora valida AMBOS campos.
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Procesando datos...')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}