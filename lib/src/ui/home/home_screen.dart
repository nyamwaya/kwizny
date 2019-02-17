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
    //HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      body: Container(
        alignment: Alignment(0.0, 0.0),
        child: StreamBuilder(
          stream: Firestore.instance.collection("kwizin_feed").snapshots(),//_bloc.geFeedListItems(),
          builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData) return LinearProgressIndicator();
            return _buildList(context, snapshot.data.documents);

            // if (snapshot.hasData != null) {
              
            //   // return Container(
            //   //   child: Text("Sorry out of luck ;) "),
            //   // );
            //   // List<DocumentSnapshot> docs = snapshot.data.documents;
            //   // List<KwizinFeedList> goalsList = _bloc.mapToList(docList: docs);
            //   // if (goalsList.isNotEmpty) {
            //   //   // return buildList(goalsList);
            //   //   return ListView.builder(
            //   //     itemCount: goalsList.length,
            //   //     itemBuilder: (BuildContext context, int index) {
            //   //       return KwizinItemWidget(
            //   //         kwizinItem: goalsList[index],
            //   //       );
            //   //     },
            //   //   );
            //   // } else {
            //   //   return Text("No Goals");
            //   // }
            // } else {
            //   return Container( child:Text("no data"));
              
            // }
          },
        ),
      ),
      // body: Container(
      //   child: StreamBuilder<List<KwizinFeedList>>(
      //     stream: _bloc.geFeedListItems,
      //     builder: (BuildContext context,
      //         AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (!snapshot.hasData) {
      //         return Container(
      //           /// Better no data solution: perhaps an alert dialog
      //           child: Text("No Data 2"),
      //         );
      //       }
      //       return ListView.builder(
      //         itemCount: snapshot.data.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return KwizinItemWidget(
      //             kwizinItem: snapshot.data[index],
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }

  // buildList(BuildContext context, List<DocumentSnapshot> data) {
  //   final record = KwizinFeedList.fromSnapshot(data);
  //   data[1].
  // }

   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    //  return Container(
    //    child: Text("data"),
    //  );
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final record = KwizinFeedList.fromSnapshot(data);

   return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: KwizinItemWidget(
         kwizinItem: record,
       )
      //  child: ListTile(
      //    title: Text(record.name),
      //    trailing: Text(record.votes.toString()),
      //    onTap: () => Firestore.instance.runTransaction((transaction) async {
      //          final freshSnapshot = await transaction.get(record.reference);
      //          final fresh = Record.fromSnapshot(freshSnapshot);

      //          await transaction
      //              .update(record.reference, {'votes': fresh.votes + 1});
      //        }),
      //  ),
     ),
   );
 }
}

  //Alternative List
  // body: Container(
  //   child: KwizinListItem(
  //     kwizinImageUrl:
  //         "https://scontent-msp1-1.cdninstagram.com/vp/7b1e3ffddefa18f475bf5a431f1aea7f/5CF8839A/t51.2885-15/sh0.08/e35/p640x640/47582321_2305804029653807_7201349182155396459_n.jpg?_nc_ht=scontent-msp1-1.cdninstagram.com",
  //     kwizinRating: "5",
  //     location: "Minneapolis",
  //     name: "Tara Davis",
  //     numberOfComents: "10",
  //     numberOfLikes: "351",
  //   ),
  // ),
