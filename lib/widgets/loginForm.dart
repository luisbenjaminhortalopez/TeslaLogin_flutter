// widgets/login_form.dart
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class LoginForm extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 16),
        const CustomTextField(label: 'Contraseña', obscureText: true),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            // Agregar lógica para procesar el inicio de sesión
            // y navegar a otra pantalla si es exitoso.
          },
          style: 
          ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text('Iniciar Sesión'),
        ),
      ],
    );
  }
}