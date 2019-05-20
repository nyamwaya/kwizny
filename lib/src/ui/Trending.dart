import 'package:flutter/material.dart';
import 'package:kwizny/src/widgets/ProfilePreviewCard.dart';

class TrendingPage extends StatefulWidget {
  @override
  TrendingState createState() {
    return new TrendingState();
  }
}

class TrendingState extends State<TrendingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: new BackButton(
                  color: Color(0xfff07827),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Text(
              "Best Vegan",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
        Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 6),
            child: Text(
              "15 result to food name",
              style: TextStyle(fontSize: 20),
            )),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),

            //  / padding: EdgeInsets.all(200),
            itemBuilder: (context, position) {
              return ProfilePreviewCard(
                pictureUrl:
                    'https://scontent-msp1-1.cdninstagram.com/vp/4cb7c9785d028ee0257e8fe70d6dfc46/5D9BF3D9/t51.2885-15/e35/p1080x1080/59267607_320990808597012_9111659535289989372_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com',
                kwizinTitle: 'Tropical Fruit',
                KwizinLocation: 'SanFransisco, Ca',
                fiveStarRating: '5',
              );
            },
            itemCount: 10,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        )
      ],
    ));
  }
}
