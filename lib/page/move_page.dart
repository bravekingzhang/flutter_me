import 'package:flutter/material.dart';
import 'package:douban_me/widget/video_demo.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'dart:async';
import 'package:device_info/device_info.dart';

class VideoPage extends StatefulWidget {

  final String beeUri;
  final String title;

  const VideoPage({Key key,this.beeUri,this.title}) : super(key: key);

  static const String routeName = '/video';

  @override
  _VideoDemoState createState() => new _VideoDemoState();
}

final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

Future<bool> isIOSSimulator() async {
  return Platform.isIOS && !(await deviceInfoPlugin.iosInfo).isPhysicalDevice;
}

class _VideoDemoState extends State<VideoPage>
    with SingleTickerProviderStateMixin {

  VideoPlayerController beeController;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final Completer<Null> connectedCompleter = new Completer<Null>();
  bool isSupported = true;

  @override
  void initState() {
    super.initState();
    beeController = new VideoPlayerController.network(
        widget.beeUri
    );
    Future<Null> initController(VideoPlayerController controller) async {
      controller.setLooping(true);
      controller.setVolume(0.0);
      controller.play();
      await connectedCompleter.future;
      await controller.initialize();
      setState(() {});
    }
    initController(beeController);
    isIOSSimulator().then((bool result) {
      isSupported = !result;
    });
  }

  @override
  void dispose() {
    beeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: const Text('视频详情'),
      ),
      body: isSupported
          ? new ConnectivityOverlay(
              child: new VideoCard(
                title: widget.title,
                subtitle: '',
                controller: beeController,
              ),
              connectedCompleter: connectedCompleter,
              scaffoldKey: scaffoldKey,
            )
          : const Center(
              child: const Text(
                'The video demo is not supported on the iOS Simulator.',
              ),
            ),
    );
  }
}
