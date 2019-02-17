import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/models/kwizin_feed_list.dart';
import 'package:kwizny/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  final _repository = Repository();

  //List of all items, part of the list
  Set<KwizinFeedList> _kwizinList = Set<KwizinFeedList>();

    // Stream to list of all possible items
  BehaviorSubject<List<KwizinFeedList>> _itemsController = BehaviorSubject<List<KwizinFeedList>>();
  Stream<List<KwizinFeedList>> get items => _itemsController;

  //Constructor
  HomeBloc(){
   // geFeedListItems();
  }

  Stream<QuerySnapshot> geFeedListItems() {
    return _repository.kwizinFeed();
  }

  //  List mapToList({DocumentSnapshot doc, List<DocumentSnapshot> docList}) {
  //   if (docList != null) {
  //     List<KwizinFeedList> goalList = [];
  //     docList.forEach((document) {
  //       String email = document.data[StringConstant.emailField];
  //       Map<String, String> goals =
  //           document.data[StringConstant.goalField] != null
  //               ? document.data[StringConstant.goalField].cast<String, String>()
  //               : null;
  //       if (goals != null) {
  //         goals.forEach((title, message) {
  //           OtherGoal otherGoal = OtherGoal(email, title, message);
  //           goalList.add(otherGoal);
  //         });
  //       }
  //     });
  //     return goalList;
  //   } else {
  //     Map<String, String> goals = doc.data[StringConstant.goalField] != null
  //         ? doc.data[StringConstant.goalField].cast<String, String>()
  //         : null;
  //     List<Goal> goalList = [];
  //     if (goals != null) {
  //       goals.forEach((title, message) {
  //         Goal goal = Goal(title, message);
  //         goalList.add(goal);
  //       });
  //     }
  //     return goalList;
  //   }
  // }


  @override
  Future dispose() async {
    _itemsController?.close();
  }
}
