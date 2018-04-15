import 'package:flutter/material.dart';
import 'duanzi_list.dart';
import 'douban_move_list.dart';

class SqurePage extends StatefulWidget {
  @override
  _SqurePageState createState() => new _SqurePageState();
}

class _SqurePageState extends State<SqurePage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new TabBar(
            tabs: [new Text("豆瓣电影"), new Text("各种段子")],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
          ),
        ),
        body: new TabBarView(children: [
          new DoubanMoveList(),
          new DuanZiList(),
        ]),
      ),
    );
  }
}
