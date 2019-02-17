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

  @override
  Future dispose() async {
    _itemsController?.close();
  }
}
