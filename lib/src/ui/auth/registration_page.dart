import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/auth/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RegistrationForm(),
        ),
      ),
    );
  }
}