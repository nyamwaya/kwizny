import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/signUp_form.dart';

class SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      alignment: Alignment(0.0, 0.0),
      child: SignupForm(),
    );
  }
}
