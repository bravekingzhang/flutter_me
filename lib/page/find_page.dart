import 'package:flutter/material.dart';

import 'verse_page.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发现'),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.poll),
            title: new Text('生成藏头诗'),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new VsersePage()));
            },
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.today),
            title: new Text('历史上的今天'),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.games),
            title: new Text('讲个笑话'),
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.memory),
            title: new Text('机器人'),
          ),
        ],
      ),
    );
  }
}
