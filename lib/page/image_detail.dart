import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDetail extends StatefulWidget {
  final String image;

  @override
  _ImageDetailState createState() => new _ImageDetailState();

  const ImageDetail({Key key, this.image}) : super(key: key);
}

class _ImageDetailState extends State<ImageDetail> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图片详情'),
      ),
      body: new Center(
        child: new CachedNetworkImage(imageUrl: widget.image),
      ),
    );
  }
}
