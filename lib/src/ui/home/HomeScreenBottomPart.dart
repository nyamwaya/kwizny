import 'package:flutter/material.dart';
import 'package:kwizny/src/ui/Trending.dart';
import 'package:kwizny/src/ui/home/details/kwizin_detail_page.dart';
import 'package:kwizny/src/widgets/CardScrollWidget.dart';
import 'package:kwizny/src/widgets/StarDisplay.dart';
import 'package:kwizny/utils/data.dart';

class HomeScreenBottomPart extends StatefulWidget {
  @override
  HomeScreenBottomPartState createState() {
    return new HomeScreenBottomPartState();
  }
}

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

var viewAllStyle = TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.bold, color: appTheme.primaryColor);

class HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Trending this week",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xff000000),
                  )),
            ],
          ),
        ),

        GestureDetector(
             onTap: () {
          print(   Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context) => new TrendingPage())));
        },
         child: Container(
          height: 212.8,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              _whatsNew(
                  "https://scontent-msp1-1.cdninstagram.com/vp/956d655adc36a81c061b0d71a2bd5106/5D782F63/t51.2885-15/sh0.08/e35/p640x640/50088376_2159236274337219_6373459363179563352_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com"),
              _whatsNew(
                  "https://scontent-msp1-1.cdninstagram.com/vp/48a27bf45c61d6ec67a38c3ea2b57aa5/5D53B760/t51.2885-15/e35/57574644_418010862329876_1409660303091630638_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com"),
              _whatsNew(
                  "https://scontent-msp1-1.cdninstagram.com/vp/04be3de8ca0f83a5c99e1eb26cfa7ce8/5D6567AC/t51.2885-15/e35/58410255_608873336249140_2169482679759699819_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com"),
              _whatsNew(
                  "https://scontent-msp1-1.cdninstagram.com/vp/fae6f30bc16f53784e411d2d706070a5/5D587F45/t51.2885-15/e35/56823608_336842583699623_8387771107355463660_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com"),
              _whatsNew(
                  "https://scontent-msp1-1.cdninstagram.com/vp/8f159d41586b72f358f47d48306dc4ab/5D67C2A2/t51.2885-15/e35/58410227_2162795233758137_8474950525615283953_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com")
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 20.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Most Popular",
                  style: TextStyle(fontSize: 24.0, color: Color(0xff000000))),
              Spacer(),
              Text("VIEW ALL (7)",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFF3791A),
                  ))
            ],
          ),
        ),
        Container(
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/a26c3a75820323f81eafcf3cced91a35/5D6288D6/t51.2885-15/e35/42843542_1133167243498683_8225773076057354057_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  4),
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/bd970ab91ef19b550edf8d920678b6a8/5D6F2F50/t51.2885-15/e35/56781261_643973269366626_2587653085580655040_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  3),
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/e1725b164bbafb233b81f72bf53642c1/5D777B7C/t51.2885-15/e35/55823669_401410903748385_4202470497017056300_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  5),
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/57ca35ec31cbc4cb07ee26e223a7e469/5D573D18/t51.2885-15/e35/54512841_2149510565339708_2321071887340092884_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  3),
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/bb268142e22303807fd8bc815c4f33bd/5D76DD80/t51.2885-15/sh0.08/e35/s750x750/53699533_1169134599958719_625732123777547793_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  5),
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/c3f56266a6d85ec1b7345c1722f629da/5D6B7803/t51.2885-15/e35/52620838_443388223097201_3364855255378981951_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  5),
              _newThisWeek(
                  "https://scontent-msp1-1.cdninstagram.com/vp/1358124e09cdaa0ff9396d0bfc4ddc19/5D54080A/t51.2885-15/e35/58453560_468907830319569_1401371501344299833_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
                  4),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _newThisWeek(String pictureUrl, int rating) => new GestureDetector(
        onTap: () {
          print(   Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context) => new KwizinDetailPage())));
        },
        child: new Container(
          child: Row(
            children: <Widget>[
              Container(
                width: 175,
                height: 160,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    pictureUrl,
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Beef Burger and \nSteak",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff000000)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('New',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff00e047))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('-',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff525257))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text('0.4 mi from you',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff525257))),
                            ),
                          ],
                        ),
                      ),
                      StarDisplay(
                        value: rating,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));

  Widget _whatsNew(String pictureUrl) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Container(
            height: 212.8,
            width: 357.86,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ],
                ),
                image: DecorationImage(
                    image: new NetworkImage(pictureUrl),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Best Vegan",
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )));
  }

  Container _heroImage() {
    return new Container(
      constraints: new BoxConstraints.expand(height: 200.0),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(
              "https://scontent-msp1-1.cdninstagram.com/vp/8f159d41586b72f358f47d48306dc4ab/5D67C2A2/t51.2885-15/e35/58410227_2162795233758137_8474950525615283953_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Stack(
        children: <Widget>[
          new Positioned(
              child: new Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: new BackButton(
              color: Colors.white,
            ),
          )),
          new Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 155.0,
            //   height: 70.0,
            child: new Container(
              decoration: new BoxDecoration(
                  // borderRadius: new BorderRadius.circular(8.0),
                  gradient: new LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              )),
              padding: const EdgeInsets.all(24.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
