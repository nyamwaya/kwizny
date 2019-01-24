import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  RootScreenState createState() {
    return new RootScreenState();
  }
}

class RootScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
