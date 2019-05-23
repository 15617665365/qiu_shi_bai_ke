import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final String url;

  const HomePage({Key key, this.url}) : super(key: key);
  @override
  HomePageState createState() => new HomePageState(url);
}

class HomePageState extends State<HomePage> {
  IjkMediaController controller = IjkMediaController();

  final String url;

  HomePageState(this.url);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: 400,
        child:  buildIjkPlayer()
//        ListView(
//            children: <Widget>[
//              buildIjkPlayer(),
//            ]
//        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () async {
          await controller.setNetworkDataSource(
            'http://ks-hdllive.app-remix.com/live/244758639825442396.flv',
//              'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
//               'rtmp://172.16.100.245/live1',
              // 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
//              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
//               'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
              // "file:///sdcard/Download/Sample1.mp4",
              autoPlay: true);
          print("set data source success");
          // controller.playOrPause();
        },
      ),
    );
  }

  Widget buildIjkPlayer() {
    return Container(
      // height: 400, // 这里随意
      child: IjkPlayer(
        mediaController: controller,
      ),
    );
  }
}