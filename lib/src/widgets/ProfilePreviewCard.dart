import 'package:flutter/material.dart';

class ProfilePreviewCard extends StatelessWidget {
  final String pictureUrl;
  final String fiveStarRating;
  final String kwizinTitle;
  final String KwizinLocation;

  ProfilePreviewCard({this.pictureUrl, this.fiveStarRating, this.kwizinTitle, this.KwizinLocation});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(12),
        elevation: 6,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Container(
                //padding: EdgeInsets.all(100),
                margin: EdgeInsets.symmetric(vertical: 8),
                width: 152,
                height: 104,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: NetworkImage(pictureUrl),
                        fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8),
                      //alignment: Alignment(0.5, 1.0),
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [
                          //   new BoxShadow(
                          //       color: Color(0xfffc4041), blurRadius: 16.0)
                          // ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text(fiveStarRating,
                          //     style: TextStyle(
                          //         fontSize: 12.0,
                          //         fontWeight: FontWeight.bold,
                          //         color: Color(0xfffc4041))),
                          new Icon(
                            Icons.favorite_border,
                            color: Color(0xfffc4041),
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(kwizinTitle,
                  style: TextStyle(
                      color: Color(0xff192865),
                      fontWeight: FontWeight.w500,
                      //fontFamily: 'Quicksand',
                      fontSize: 14.0)),
                ],
              )
            ),
            Padding(
                padding: EdgeInsets.only(top: 4.0, bottom: 0, left: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      KwizinLocation,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          //fontFamily: 'Quicksand',
                          fontSize: 12.0),
                    ),
                    // Text(
                    //   "1d",
                    //   textAlign: TextAlign.end,
                    //   style: TextStyle(
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.w500,

                    //       //fontFamily: 'Quicksand',
                    //       fontSize: 12.0),
                    // ),
                  ],
                )),
          ],
        ));
  }
}
