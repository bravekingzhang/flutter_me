import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => new Dialog(
      child: new Container(
        width: 100.0,
        height: 150.0,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new CircularProgressIndicator(),
            new Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text('loading....'),
            )
          ],
        ),
      ),
    ),
  );
}