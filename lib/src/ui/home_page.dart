import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/authentication/authentication_bloc.dart';
import 'package:kwizny/src/widgets/log_out_button.dart';


class HomePage extends StatefulWidget{
  final String email;

  HomePage(this.email);

  @override
  RootScreenState createState() {
    return new RootScreenState();
  }
}

class RootScreenState extends State<HomePage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Center(
          child: LogOutButton(),
        )
      ),
    );
  }
}