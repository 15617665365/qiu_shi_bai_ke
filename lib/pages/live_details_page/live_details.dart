import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveDetails extends StatefulWidget {
  final String url;

  const LiveDetails({Key key, this.url}) : super(key: key);

  @override
  LiveDetailsState createState() => new LiveDetailsState(url);
}

class LiveDetailsState extends State<LiveDetails> {
  final String url;

  LiveDetailsState(this.url);

  IjkMediaController controller = IjkMediaController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: AspectRatio(
            aspectRatio: ScreenUtil.screenWidth / ScreenUtil.screenHeight,
            child: IjkPlayer(
              mediaController: controller,
            ),
          ),
        ),
        Positioned(
            top: 40,
            right: 30,
            child: GestureDetector(
              child: Image.asset(
                'images/adfree_close@3x.png',
                width: 20,
                fit: BoxFit.fill,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ))
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  initPlayer(IjkMediaController controller) async {
    await controller.setNetworkDataSource(url,
//              'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
//               'rtmp://172.16.100.245/live1',
        // 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
//              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
//               'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
        // "file:///sdcard/Download/Sample1.mp4",
        autoPlay: true);
    print("set data source success");
// controller.playOrPause();
  }
}
