import 'package:flutter/material.dart';

import 'package:douban_me/page/squre_page.dart';
import 'package:douban_me/page/find_page.dart';

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
  int mCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.star), title: new Text('广场')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.find_replace), title: new Text('发现'))
        ],
        currentIndex: mCurrentIndex,
        onTap: (index) {
          setState(() {
            mCurrentIndex = index;
          });
        },
      ),
      body: _setupCurrentPage(mCurrentIndex),
    );
  }

  Widget _setupCurrentPage(int mCurrentIndex) {
    switch (mCurrentIndex) {
      case 0:
        return new SqurePage();
      case 1:
        return new FindPage();
      default:
        return new SqurePage();
    }
  }
}
