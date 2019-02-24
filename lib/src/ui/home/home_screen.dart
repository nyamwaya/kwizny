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
        appBar: new AppBar(
          backgroundColor: Color(0xfffd4241),
          elevation: 0.0,
          title: Text("Kwiziny"),
          actions: <Widget>[
            LogOutButton()
            // IconButton(
            //   icon: Icon(Icons.exit_to_app),
            //   color: Colors.white,
            //   tooltip: 'Logout button',
            //   onPressed: () {
                
            //   },
            // ),
          ],
        ),
        body: Container(
          alignment: Alignment(0.0, 0.0),
          child: StreamBuilder(
            stream: _bloc.geFeedListItems(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return _buildList(context, snapshot.data.documents);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
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
