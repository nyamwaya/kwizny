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

  //Like Function for like button
  Future<String> userLikedPhoto(){
    var likeCounter;

    likeCounter++;

    return likeCounter;
  }

  // a way to parse the data in the bloc come back to this
  // Stream<QuerySnapshot> geFeedListItems() {
  //   return _repository.kwizinFeed();
  // }

  //   void _likePost(String postId2) {
  //   var userId = googleSignIn.currentUser.id;
  //   bool _liked = likes[userId] == true;

  //   if (_liked) {
  //     print('removing like');
  //     reference.document(postId).updateData({
  //       'likes.$userId': false
  //       //firestore plugin doesnt support deleting, so it must be nulled / falsed
  //     });

  //     setState(() {
  //       likeCount = likeCount - 1;
  //       liked = false;
  //       likes[userId] = false;
  //     });

  //     removeActivityFeedItem();
  //   }

  //   if (!_liked) {
  //     print('liking');
  //     reference.document(postId).updateData({'likes.$userId': true});

  //     addActivityFeedItem();

  //     setState(() {
  //       likeCount = likeCount + 1;
  //       liked = true;
  //       likes[userId] = true;
  //       showHeart = true;
  //     });
  //     new Timer(const Duration(milliseconds: 500), () {
  //       setState(() {
  //         showHeart = false;
  //       });
  //     });
  //   }
  // }

  @override
  Future dispose() async {
    _itemsController?.close();
  }
}
