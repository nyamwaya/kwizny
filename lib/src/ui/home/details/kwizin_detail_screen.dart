import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:kwizny/utils/MyChoiceChip.dart';

class KwizinDetailScreen extends StatefulWidget {
  @override
  KwizinDetailScreenState createState() {
    return new KwizinDetailScreenState();
  }
}

class KwizinDetailScreenState extends State<KwizinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            hero(),
            _heading(),
            //rating(),
            reviews(),
          ],
        ),
      ),
    );
  }

  Widget rating() {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                "80 ratings",
                style: const TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.black,
                  fontSize: 16.0,
                  //fontFamily: 'Quicksand'
                ),
              ),
              Row(
                children: <Widget>[
                  StarRating(
                    color: Colors.red,
                    rating: 1,
                    starCount: 5,
                    size: 24,
                  ),
                ],
              )
            ]));
  }

  Stack hero() {
    return Stack(children: <Widget>[
      //First thing in the stack is the background
      //For the backgroud i create a column
      Column(
        children: <Widget>[
          //first element in the column is the white background (the Image.asset in your case)
          DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue),
              child: Container(
                  constraints: new BoxConstraints.expand(height: 350.0),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(
                          "https://scontent-msp1-1.cdninstagram.com/vp/5ba99ac3efe0e958d87ac526de06654c/5D7326B7/t51.2885-15/sh0.08/e35/p640x640/59434985_2224935931104720_7807757091945371419_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        child: new BackButton(
                          color: Color(0xfff07827),
                        ),
                      ),
                    ],
                  ))),
          //second item in the column is a transparent space of 20
          //  Container(height: 20.0)
        ],
      ),
      //for the button i create another column
      // Column(children: <Widget>[
      //   //first element in column is the transparent offset
      //   Container(height: 305.0),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: <Widget>[
      //       Container(
      //         margin: EdgeInsets.all(8),
      //         //alignment: Alignment(0.5, 1.0),
      //         width: 60.0,
      //         height: 60.0,
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             boxShadow: [
      //               new BoxShadow(color: Color(0xfffc4041), blurRadius: 8.0)
      //             ],
      //             borderRadius: BorderRadius.all(Radius.circular(50.0))),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             // Text(fiveStarRating,
      //             //     style: TextStyle(
      //             //         fontSize: 12.0,
      //             //         fontWeight: FontWeight.bold,
      //             //         color: Color(0xfffc4041))),
      //             new Icon(
      //               Icons.favorite_border,
      //               color: Color(0xfffc4041),
      //               size: 30.0,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   )
      // ])
    ]);
  }

  Container _heading() {
    return Container(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        margin: EdgeInsets.only(
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "American salmon sushi",
                  style: const TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    //fontFamily: 'Quicksand'
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: <Widget>[
                  new Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4,
                    ),
                    child: new Text(
                      "Uptown, Minneapolis",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        //fontFamily: 'Quicksand',
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: 12.0,
            ),

            //submit button
          ],
        ));
  }

  Widget directionButton() {
    return OutlineButton(
      //textColor: Color(0xfffc4041),
      child: Text(
        "Directions",
        style: TextStyle(color: Color(0xfffc4041), fontFamily: 'sofiapro'),
      ),
      color: Color(0xfffc4041),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      onPressed: null,
      disabledBorderColor: Color(0xfffc4041),
    );
  }

  Widget reviews() {
    return Container(
      padding: EdgeInsets.only(top: 0.0, left: 12.0, right: 4.0),
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 12,),
            child: Text(
              "foodieapolis Cheesy perfection! 📷 @scottmeinzer 🍔 @eastsidempls #burger #cheeseburger #dailyfoodfeed #minnesota #mpls #vscofood #feedfeed #f52grams #eeeeeats #eater #foodporn #foodie #foodieapolis #huffposttaste #buzzfeedfood #twincities #experiencelocal #twincities #supportlocal #eatfamous #eatertwincities #zagat #foodbeast #buzzfeast #foodgawker #foodilysm #tryitordiet #devourpower",
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'sofiapro',
                  color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: new ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 200),
                child: RaisedButton(
                  child: const Text(
                    'Save for later',
                  ),
                  textColor: Colors.white,
                  color: Color(0xfffc4041),
                  elevation: 4.0,
                  splashColor: Color(0xff192865),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CommentAndRateScreen()),
                    // );
                  },
                )),
          )
        ],
      ),
    );
  }

  Row userComentBlock() {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 24.0),
            width: 50.0,
            height: 50.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              boxShadow: [
                new BoxShadow(color: Colors.black38, blurRadius: 8.0)
              ],
              image: new DecorationImage(
                //TODO: if not profile photo, add random robot
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              //border: new Border.all(color: Color(0xfffc4041), width: 4.0)
            )),
        new Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Tara Davis",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: 'sofiapro'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "45 Reviews, 353 Followers",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontFamily: 'sofiapro'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container userComentReview() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: //comenter
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 60.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Color(0xfffc4041),
                    boxShadow: [
                      new BoxShadow(color: Color(0xfffc4041), blurRadius: 8.0)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("5",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'sofiapro',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    new Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16.0,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildDescription() {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Text(
        "coments",
        style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            //fontWeight: FontWeight.w400,
            fontFamily: 'Quicksand'),
      ),
    );
  }

  Widget _buildSectionTitleText() {
    final _directionsTitle = 'Location';
    return Container(
        padding: new EdgeInsets.only(left: 20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              _directionsTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Quicksand',
                  //fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                  fontSize: 24.0),
            ),
          ],
        ));
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.red),
    );
  }

  Widget _kwiznyValue({String value, IconData icon}) {
    return new Container(
      child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Icon(
          icon,
          size: 16.0,
        ),
        new Container(width: 8.0),
        new Text(
          value,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Quicksand'),
        ),
      ]),
    );
  }
}
