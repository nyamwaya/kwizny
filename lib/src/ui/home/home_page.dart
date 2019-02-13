import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/home/home_screen.dart';

class HomePage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeScreen(),
      )
    );
  }
  // @override
  // RootScreenState createState() {
  //   return new RootScreenState();
  // }
}

// class RootScreenState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: HomeScreen(),
//       )
//     );
//   }
// }
