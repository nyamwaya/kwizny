import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  // Separator({this.margin, this.height, this.width, this.color});

  // final EdgeInsetsGeometry margin;
  // final double height;
  // final double width;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return new Container(
       margin: new EdgeInsets.symmetric(vertical: 24.0),
        height: 1.0,
        width: double.infinity,
        color: Colors.black12,
      // margin: new EdgeInsets.symmetric(vertical: 8.0),
      // height: 2.0,
      // width: 18.0,
      // color: new Color(0xFFfc5185),
    );
  }

    //   return Container(
    //   padding: const EdgeInsets.only(left: 0.0, right: 0.0),
    //   child: Separator(
    //     margin: new EdgeInsets.symmetric(vertical: 24.0),
    //     height: 1.0,
    //     width: double.infinity,
    //     color: Colors.black12,
    //   ),
    // );

  
}




