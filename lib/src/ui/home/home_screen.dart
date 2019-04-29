import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/blocs/home/home_bloc.dart';
import 'package:kwizny/src/models/kwizin_feed_list.dart';
import 'package:kwizny/src/widgets/kwizin_list_item.dart';
import 'package:kwizny/src/widgets/log_out_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

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
    return SafeArea(
      child: Scaffold(

        body: ListView(
          children: <Widget>[
            searchBox(),
            Container(
              alignment: Alignment(0.0, 0.0),
              child: StreamBuilder(
                stream: _bloc.geFeedListItems(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return LinearProgressIndicator();
                  return _buildList(context, snapshot.data.documents);
                },
              ),
            ),
          ],
        ),

        
      ),
    );
  }

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
