import 'package:flutter/material.dart';
import 'package:kwizny/src/widgets/CardScrollWidget.dart';
import 'package:kwizny/utils/data.dart';

class HomeScreenBottomPart extends StatefulWidget {
  @override
  HomeScreenBottomPartState createState() {
    return new HomeScreenBottomPartState();
  }
}

class HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
    var currentPage = images.length - 1.0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    PageController controller = PageController(initialPage: images.length -1);
    controller.addListener((){
      setState(() {
       currentPage = controller.page; 
      });
    });
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Trending",
                style: TextStyle(
                    color: Colors.black, fontSize: 36.0, letterSpacing: 1.0),
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            CardScrollWidget(currentPage),
            Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context, index){
                  return Container();
                },
              ),
            )
          ],
        ),
           Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Favourite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.open_in_browser,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
      ],
    ));
  }
}
