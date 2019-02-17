import 'package:cloud_firestore/cloud_firestore.dart';

class KwizinFeedList {
   String _pictureURL;
   String _name;
   String _userName;
   String _rating;
   String _likes;
   String _comments;
   String _restaurants;
   String _location;
   String _id;


  KwizinFeedList(
    this._pictureURL, 
    this._name, 
    this._userName,
    this._rating,
    this._likes,
    this._comments, 
    this._restaurants,
    this._location,
    this._id);

  KwizinFeedList.map(dynamic data){
    this._pictureURL = data['pictureURL'];
    this._name = data['name'];
    this._userName = data['userName'];
    this._rating = data['rating'];
    this._likes = data['likes'];
    this._comments = data['comments'];
    this._restaurants= data['restaurants'];
    this._location = data['location'];
    this._id = data[id];
  }

   KwizinFeedList.fromSnapshot(DocumentSnapshot snapshot)
     : this.map(snapshot.data);

  String get pictureURL => _pictureURL;

  String get name => _name;

  String get userName => _userName;

  String get rating => _rating;

  String get numberOfLikes => _likes;

  String get numberOfComents => _comments;

  String get restaurants => _restaurants;

  String get location => _location;

  String get id => _id;


}