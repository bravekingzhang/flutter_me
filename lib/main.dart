import 'package:flutter/material.dart';
import 'dart:io';
import 'douban_move_model.dart';
import 'dart:convert';

import 'douban_move_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var start = 0;
  List<DoubanModel> mDoubans = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDoubanMoves(false);
  }

  @override
  Widget build(BuildContext context) {
    return buildDefaultTabController();
  }

  DefaultTabController buildDefaultTabController() {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new TabBar(
            tabs: [new Text("豆瓣电影"), new Text("内涵段子")],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
          ),
        ),
        body: new TabBarView(children: [
          new DoubanMoveList(
            mDoubanItem: mDoubans,
            voidCallback: () {
              _getDoubanMoves(true);
            },
          ),
          new Text("page2")
        ]),
      ),
    );
  }

  _getDoubanMoves(loadMore) async {
    if (!loadMore) {
      showLoading();
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
            this.mDoubans = items;
          } else {
            this.mDoubans.addAll(items);
          }
          this.start = this.mDoubans.length;
        });
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
                  content: Text('网路错误'),
                ));
      }
    } catch (exception) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                content: Text('网路错误'),
              ));
    }
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => new Dialog(
            child: new Container(
              alignment: Alignment.center,
              width: 100.0,
              height: 100.0,
              child: new Stack(
                children: <Widget>[
                  new CircularProgressIndicator(),
                  new Text('loading....')
                ],
              ),
            ),
          ),
    );
  }
}
