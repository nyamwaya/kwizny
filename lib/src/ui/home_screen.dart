import 'package:flutter/material.dart';
import 'package:kwizny/src/widgets/log_out_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LogOutButton()
        ],

      ),
    );
  }
}
