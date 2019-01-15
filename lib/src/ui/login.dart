import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/login_form.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      alignment: Alignment(0.0,0.0),
      child: LoginForm(),
    );
  }
}