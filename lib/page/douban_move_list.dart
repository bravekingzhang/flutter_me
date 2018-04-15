import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:douban_me/model/douban_move_model.dart';
import 'package:douban_me/widget/StarRating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'image_detail.dart';
import 'package:douban_me/widget/utils.dart';
import 'dart:io';
import 'dart:convert';

class DoubanMoveList extends StatefulWidget {

  const DoubanMoveList({Key key})
      : super(key: key);

  @override
  _DoubanMoveListState createState() => new _DoubanMoveListState();
}

class _DoubanMoveListState extends State<DoubanMoveList> {
  int start = 0;
  List<DoubanModel> mDoubanList  = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDoubanMoves(false);
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: mDoubanList.length,
            itemBuilder: buildItem));
  }

  Widget buildItem(BuildContext context, int index) {
    if (index == mDoubanList.length - 1) {
      //已经加载了最后一个元素了，现在加载更多
      _getDoubanMoves(true);
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
                          new TextSpan(text: mDoubanList[index].title),
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: buildRating(mDoubanList[index]),
                        ),
                      ],
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: buildMoveTag(mDoubanList[index]),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              new Container(
                margin: EdgeInsets.only(right: 15.0),
                child: new Text.rich(
                  new TextSpan(
                      text: '${mDoubanList[index].rating.average}'),
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
                        mDoubanList[index].directors[0].name,
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
                        children: buildActors(mDoubanList[index].casts),
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
                                    image: mDoubanList[index].images["large"],
                                  )));
                    },
                    child: new CachedNetworkImage(
                      imageUrl: mDoubanList[index].images["large"],
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
  _getDoubanMoves(loadMore) async {
    if (!loadMore) {
      showLoading(context);
    }
    var pageCount = 10;
    var url =
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&start=$start&count=$pageCount&client=&udid=';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonString = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonString);
        List moves = data['subjects'];
        List<DoubanModel> items = new List();
        for (var value in moves) {
          items.add(new DoubanModel.fromJson(value));
        }
        setState(() {
          if (start == 0) {
            Navigator.pop(context);
            this.mDoubanList = items;
          } else {
            this.mDoubanList.addAll(items);
          }
          this.start = this.mDoubanList.length;
        });
      } else {
        showNetWorkErr();
      }
    } catch (exception) {
      showNetWorkErr();
    }
  }

  void showNetWorkErr() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Container(
          width: 100.0,
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: new Center(
            child: AlertDialog(
              content: Text('网路错误'),
            ),
          ),
        ));
  }
}
