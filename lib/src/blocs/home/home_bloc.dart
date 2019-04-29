import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/models/Location.dart';
import 'package:kwizny/src/models/kwizin_feed_list.dart';
import 'package:kwizny/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  final _repository = Repository();
  List<String> locations = List();
  String fromLocation, toLocation;

  //List of all items, part of the list
  Set<KwizinFeedList> _kwizinList = Set<KwizinFeedList>();

  // Stream to list of all possible items
  BehaviorSubject<List<KwizinFeedList>> _itemsController =
      BehaviorSubject<List<KwizinFeedList>>();
  Stream<List<KwizinFeedList>> get items => _itemsController;

// location stream
  StreamController<String> fromLocationController = PublishSubject<String>();
  StreamController<String> toLocationController = PublishSubject<String>();
  StreamController<List<String>> locationsController = StreamController<List<String>>();
  StreamController<QuerySnapshot> citiesSnapshotController = StreamController<QuerySnapshot>();
  StreamController<int> citiesCounterController = StreamController<int>();
  StreamController<bool> flightSelectedController = PublishSubject<bool>();

  StreamSink<String> get addFromLocation => fromLocationController.sink;
  Stream<String> get fromLocationStream => fromLocationController.stream;
  Function(bool) get updateFlightSelection => flightSelectedController.sink.add;

  StreamSink<List<String>> get addLocationsList => locationsController.sink;
  Stream<List<String>> get locationsStream => locationsController.stream;

  StreamSink<String> get addToLocation => toLocationController.sink;
  Stream<String> get toLocationStream => toLocationController.stream;

  Stream<bool> get isFlightSelectedStream => flightSelectedController.stream;


  StreamSink<QuerySnapshot> get citiesSnapshot => citiesSnapshotController.sink;
  Stream<QuerySnapshot> get citiesSnapshotStream =>
      citiesSnapshotController.stream;

  StreamSink<int> get citiesCounter => citiesCounterController.sink;

  addLocations(List<DocumentSnapshot> snapshots) {
    locations?.clear();
    for (int i = 0; i < snapshots.length; i++) {
      final Location location = Location.fromSnapshot(snapshots[i]);
      print('location ${location.name}');
      locations.add(location.name);
    }
    addLocationsList.add(locations);
    addFromLocation.add(locations[0]);
  }

  //Constructor
  HomeBloc() {
    fromLocationStream.listen((location) {
      fromLocation = location;
    }); // geFeedListItems();

    toLocationStream.listen((location) {
      toLocation = location;
    });

    _repository.getCities().listen((event) {
      citiesSnapshot.add(event);
      citiesCounter.add(event.documents.length);
    });

    _repository.getLocations().listen((event) {
      print('location updated from firestore');
      addLocations(event.documents);
    });
  }

  // Stream<QuerySnapshot> geFeedListItems() {
  //   return _repository.kwizinFeed;
  // }

  //Like Function for like button
  Future<String> userLikedPhoto() {
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
  void dispose() {
    _itemsController?.close();
    fromLocationController.close();
    toLocationController.close();
    locationsController.close();
    citiesSnapshotController.close();
    citiesCounterController.close();
    flightSelectedController.close();
  }
}
