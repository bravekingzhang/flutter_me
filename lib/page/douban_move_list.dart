import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:douban_me/model/douban_move_model.dart';
import 'package:douban_me/widget/StarRating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'imageDetail.dart';

class DoubanMoveList extends StatefulWidget {
  final VoidCallback voidCallback;
  final List<DoubanModel> mDoubanItem;

  const DoubanMoveList({Key key, this.mDoubanItem, this.voidCallback})
      : super(key: key);

  @override
  _DoubanMoveListState createState() => new _DoubanMoveListState();
}

class _DoubanMoveListState extends State<DoubanMoveList> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: widget.mDoubanItem.length,
            itemBuilder: buildItem));
  }

  Widget buildItem(BuildContext context, int index) {
    if (index == widget.mDoubanItem.length - 1) {
      //已经加载了最后一个元素了，现在加载更多
      widget.voidCallback();
    }
    return new Card(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(left: 15.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text.rich(
                          new TextSpan(text: widget.mDoubanItem[index].title),
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: buildRating(widget.mDoubanItem[index]),
                        ),
                      ],
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: buildMoveTag(widget.mDoubanItem[index]),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(right: 15.0),
                child: new Text.rich(
                  new TextSpan(
                      text: '${widget.mDoubanItem[index].rating.average}'),
                  style: new TextStyle(fontSize: 32.0, color: Colors.blue),
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new Divider(
              height: 15.0,
              color: Colors.black26,
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(left: 15.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(
                      '导演',
                      style: new TextStyle(fontSize: 15.0),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0),
                      child: new Text(
                        widget.mDoubanItem[index].directors[0].name,
                        style: new TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Text(
                      '领衔主演',
                      style: new TextStyle(fontSize: 15.0),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Row(
                        children: buildActors(widget.mDoubanItem[index].casts),
                      ),
                    )
                  ],
                ),
              ),
              new Container(
                  margin: EdgeInsets.only(right: 15.0, bottom: 8.0),
                  width: 80.0,
                  height: 120.0,
                  child: new GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ImageDetail(
                                    image: widget
                                        .mDoubanItem[index].images["large"],
                                  )));
                    },
                    child: new CachedNetworkImage(
                      imageUrl: widget.mDoubanItem[index].images["large"],
                      errorWidget: new Icon(Icons.error),
                      fadeOutDuration: new Duration(seconds: 1),
                      fadeInDuration: new Duration(seconds: 3),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  ///生成电影的标签
  Row buildMoveTag(DoubanModel mDoubanItem) {
    List<Widget> list = new List();
    for (var value in mDoubanItem.genres) {
      list.add(new Container(
        margin: new EdgeInsets.only(right: 8.0),
        padding:
            new EdgeInsets.only(left: 3.0, right: 3.0, top: 1.0, bottom: 1.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(3.0)),
          color: Colors.blue,
        ),
        child: new Text.rich(
          new TextSpan(text: value),
          style: new TextStyle(color: Colors.white, fontSize: 8.0),
        ),
      ));
    }
    return new Row(
      children: list,
    );
  }

  Widget buildRating(DoubanModel mDoubanItem) {
    return Container(
      child: new StarRating(
        rating: mDoubanItem.rating.average / mDoubanItem.rating.max * 5,
        size: 11.0,
      ),
    );
  }

  List<Widget> buildActors(List<Avatar> avatars) {
    List<Widget> list = new List();
    for (var value in avatars) {
      list.add(new Column(
        children: <Widget>[
          new Container(
            width: 45.0,
            height: 45.0,
            child: new GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ImageDetail(
                              image: value.icons['large'],
                            )));
              },
              child: new CachedNetworkImage(
                  errorWidget: new Icon(Icons.error),
                  fadeOutDuration: new Duration(seconds: 1),
                  fadeInDuration: new Duration(seconds: 3),
                  imageUrl: value.icons['large']),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 5.0),
            child: new Text(
              value.name,
              style: new TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ));
    }
    return list;
  }
}
