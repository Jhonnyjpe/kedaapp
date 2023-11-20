import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormScreen extends StatelessWidget {
  final form = FormGroup({
    'nombres': FormControl<String>(),
    'correo': FormControl<String>(validators: [Validators.email]),
    'telefono': FormControl<String>(validators: [
      Validators.pattern(
        r'^[0-9]+$',
      )
    ]),
    'notas': FormControl<String>(),
  });

  FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                ReactiveTextField<String>(
                  formControlName: 'nombres',
                  decoration: InputDecoration(labelText: 'Nombres'),
                ),
                SizedBox(height: 10),
                ReactiveTextField<String>(
                  formControlName: 'correo',
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                ),
                SizedBox(height: 10),
                ReactiveTextField<String>(
                  formControlName: 'telefono',
                  decoration: InputDecoration(labelText: 'Número de Teléfono'),
                ),
                SizedBox(height: 10),
                ReactiveTextField<String>(
                  formControlName: 'notas',
                  decoration: InputDecoration(labelText: 'Notas Adicionales'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    if (form.valid) {
                      print('Formulario válido');
                      print('Nombres: ${form.control('nombres').value}');
                      print('Correo: ${form.control('correo').value}');
                      print('Teléfono: ${form.control('telefono').value}');
                      print('Notas: ${form.control('notas').value}');
                    } else {
                      print('Formulario no válido');
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
