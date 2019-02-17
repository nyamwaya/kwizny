import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kwizny/src/bloc_helpers/bloc_base.dart';
import 'package:kwizny/src/blocs/home/home_bloc.dart';
import 'package:kwizny/src/models/kwizin_feed_list.dart';

class KwizinItemWidget extends StatefulWidget {
  final KwizinFeedList kwizinItem;

  KwizinItemWidget({
    Key key,
    @required this.kwizinItem,
  }) : super(key: key);

  @override
  _KwizinItemWidgetState createState() => _KwizinItemWidgetState();
}

class _KwizinItemWidgetState extends State<KwizinItemWidget> {
  HomeBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // As the context should not be used in the "initState()" method,
    // prefer using the "didChangeDependencies()" when you need
    // to refer to the context at initialization time
    _initBloc();
  }

  @override
  void didUpdateWidget(KwizinItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // as Flutter might decide to reorganize the Widgets tree
    // it is preferable to recreate the links
    _disposeBloc();
    _initBloc();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  // This routine is reponsible for creating the links
  void _initBloc() {
    // Create an instance of the ShoppingItemBloc
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  void _disposeBloc() {
    _bloc?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          newsFeedHeader(),
          newsFeedImage(),
          kwizinListFooter()
        ],
      ),
    );
  }

  Row newsFeedHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[userTitle(), kwizinRateing()],
    );
  }

  //title of the card name, and location
  Container userTitle() {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1531078215167-91fcfe45b39e?ixlib=rb-0.3.5&s=786d61b2a3ed74d1f981ee230b1a9457&auto=format&fit=crop&w=1098&q=80.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.kwizinItem.name}",
                  style: TextStyle(
                      fontFamily: 'sofiapro',
                      fontSize: 20,
                      color: Color(0xff192865),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "${widget.kwizinItem.location}",
                    style:
                        TextStyle(color: Colors.grey, fontFamily: 'sofiapro'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        size: 15,
                        color: Colors.grey.shade400,
                      ),
                      new Container(
                        width: 4,
                      ),
                      Text("Posted 2 hours ago",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontFamily: 'sofiapro'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

//rating of kwizin
  Container kwizinRateing() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: Color(0xfffee9eb),
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${widget.kwizinItem.rating}",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'sofiapro',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffc4041))),
                new Icon(
                  Icons.star,
                  color: Color(0xfffc4041),
                  size: 16.0,
                ),
              ],
            ),
          ),
          Text(
            "Outstanding!",
            style: TextStyle(
                color: Color(0xfffd4241),
                fontWeight: FontWeight.bold,
                fontFamily: 'sofiapro'),
          )
        ],
      ),
    );
  }

//kwizin image
  Container newsFeedImage() {
    return Container(
      height: 300,
      width: 800,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xfffee9eb),
              blurRadius: 12.0,
              offset: Offset(1, 28),
              spreadRadius: -10,
            ),
          ],
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
              image: NetworkImage(
                "${widget.kwizinItem.pictureURL}",
              ),
              fit: BoxFit.cover)),
    );
  }

  //kwizin fotter
  Padding kwizinListFooter() {
    return Padding(
      padding: EdgeInsets.only(top: 32, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: Color(0xfffc4041),
                  size: 28,
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${widget.kwizinItem.numberOfLikes}",
                  style: TextStyle(
                      color: Color(0xff192865),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sofiapro',
                      fontSize: 18),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.mode_comment,
                  color: Colors.grey.shade300,
                  size: 28,
                ),
                Container(
                  width: 8,
                ),
                Text(
                  "${widget.kwizinItem.numberOfComents}",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontFamily: 'sofiapro',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
