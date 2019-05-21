import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/blocs/home/home_bloc.dart';
import 'package:kwizny/src/models/CustomShapeClipper.dart';
import 'package:kwizny/src/models/kwizin_feed_list.dart';
import 'package:kwizny/src/ui/home/details/kwizin_detail_page.dart';
import 'package:kwizny/src/ui/profile/profile_page.dart';
import 'package:kwizny/src/widgets/kwizin_list_item.dart';
import 'package:kwizny/utils/MyChoiceChip.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;
  Color firstColor = Color(0xFFF47D15);
  Color secondColor = Color(0xFFEF772C);

  ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [firstColor, secondColor],
            )),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          //do something
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Hi, Aleckson",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            _buildPopupMenuItem(context),
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
                          },
                          child: Icon(Icons.settings, color: Colors.white))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'What are you\nin the mood for?',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        _bloc.addToLocation.add(text);
                      },
                      style: dropDownLabelStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: InkWell(
                              onTap: () {
                                // do your search function
                                //Navigator.push(context, MaterialPageRoute(
                                //   builder: (context)=>
                                //   Inhe
                                // ))
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      child: StreamBuilder(
                        stream: _bloc.isFlightSelectedStream,
                        initialData: true,
                        builder: (context, snapshot) {
                          print('in flight - ${snapshot.data}');
                          return MyChoiceChip(Icons.location_city,
                              "Minneapolis", snapshot.data);
                        },
                      ),
                      onTap: () {
                        _bloc.updateFlightSelection(true);
                      },
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      child: StreamBuilder(
                        stream: _bloc.isFlightSelectedStream,
                        initialData: true,
                        builder: (context, snapshot) {
                          print('in hotel - ${!snapshot.data}');
                          return MyChoiceChip(
                              Icons.location_city, "St.Paul", !snapshot.data);
                        },
                      ),
                      onTap: () {
                        _bloc.updateFlightSelection(false);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<PopupMenuItem<int>> _buildPopupMenuItem(context) {
    List<PopupMenuItem<int>> popupMenuItems = List();
    for (int i = 0; i < _bloc.locations.length; i++) {
      popupMenuItems.add(PopupMenuItem(
        child: Text(
          _bloc.locations[i],
          style: dropDownMenuItemStyle,
        ),
        value: i,
      ));
    }

    return popupMenuItems;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       body: ListView(
  //         children: <Widget>[
  //           searchBox(),
  //           Container(
  //             alignment: Alignment(0.0, 0.0),
  //             child: StreamBuilder(
  //               stream: _bloc.geFeedListItems(),
  //               builder: (BuildContext context,
  //                   AsyncSnapshot<QuerySnapshot> snapshot) {
  //                 if (!snapshot.hasData) return LinearProgressIndicator();
  //                 return _buildList(context, snapshot.data.documents);
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //Move this search box to be it's own widget
  Container searchBox() {
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20.0),
            child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon:
                        Icon(Icons.search, color: Colors.red, size: 30.0),
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ))),
          ),
        ),
        SizedBox(height: 5.0),
      ],
    ));
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = KwizinFeedList.fromSnapshot(data);
    return KwizinItemWidget(
      kwizinItem: record,
    );
  }
}
