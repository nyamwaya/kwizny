import 'package:flutter/material.dart';


class RootScreen extends StatefulWidget{
  final String email;

  RootScreen(this.email);

  @override
  RootScreenState createState() {
    return new RootScreenState();
  }
}

class RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Text("Welcome"),
    );
  }
}