import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/home/HomeScreenBottomPart.dart';
import 'package:kwizny/src/ui/home/home_screen.dart';

class HomePage extends StatelessWidget {

  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
   // return HomeScreen();
   return WillPopScope(
     onWillPop: _onWillPopScope,
     child: Scaffold(
       body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Column(
           children: <Widget>[
             HomeScreen(),
             HomeScreenBottomPart()
           ],
         ),
       ),
     ),
   );
  }
}
