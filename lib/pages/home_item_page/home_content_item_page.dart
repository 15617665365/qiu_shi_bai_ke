import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiu_shi_bai_ke/model/home_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'ijkplayer_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class HomeContentItemPage extends StatefulWidget {
  final Items model;

  HomeContentItemPage(this.model);

  @override
  HomeContentItemPageState createState() => new HomeContentItemPageState(model);
}

class HomeContentItemPageState extends State<HomeContentItemPage> {
  Items model;

  HomeContentItemPageState(this.model);

  bool isImmense = false; //开心
  bool isPain = false; //痛苦
  bool _isPlaying = false;

  int currentID = 0;
  IjkMediaController controller = IjkMediaController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UnderlineTabIndicator(
//          color: Colors.white,
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
          insets: EdgeInsets.fromLTRB(10, 0, 10, 0)),
      child: Column(
        children: groupWidget(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> groupWidget() {
    List<Widget> list = [];
    if (model.format == 'video') {
      if (model.type == 'hot') {
        list.add(hotTitle());
      }
      list.add(userInfo());
      list.add(txtContent());
      list.add(videoContent());
    } else if (model.format == 'word') {
      list.add(userInfo());
      list.add(txtContent());
    } else if (model.format == 'multi') {
      list.add(userInfo());
      list.add(txtContent());
      list.add(multiContent());
    } else if (model.format == 'image') {
      list.add(userInfo());
      list.add(txtContent());
      list.add(imageContent());
    }
    list.add(commentContent());
    if (model.hotComment != null) {
      list.add(hotCommentContent());
    }

    return list;
  }

  Widget hotTitle() {
    return Container(
//      color: Colors.orange,
      margin: EdgeInsets.all(ScreenUtil().setWidth(30)),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/hot@3x.png',
            width: ScreenUtil().setWidth(45),
          ),
          Text(
            '热门',
            style: TextStyle(
                color: Colors.black54, fontSize: ScreenUtil().setSp(32)),
          )
        ],
      ),
    );
  }

  Widget userInfo() {
    return Container(
//      color: Colors.red,
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(10),
          ScreenUtil().setWidth(30),
          ScreenUtil().setWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipOval(
            child: FadeInImage.assetNetwork(
                width: ScreenUtil().setWidth(110),
                placeholder: 'images/qbf_sign_shit_empty@3x.png',
                image: (model.user.thumb == null)
                    ? 'https://static.pgyer.com/static-20190512/images/newHome/data_statis.png'
                    : model.user.thumb),
          ),
          Container(
            width: ScreenUtil().setWidth(600),
            child: Text(
              model.user.login,
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(32),
              ),
              maxLines: 1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            width: ScreenUtil().setWidth(140),
            child: InkWell(
              child: Image.asset('images/btn_focus_immersive@3x.png'),
              onTap: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(0)),
            width: ScreenUtil().setWidth(50),
            child: InkWell(
              child: Image.asset('images/adfree_close@3x.png'),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget txtContent() {
    return Container(
//      color: Colors.pinkAccent,
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(0)),
      width: ScreenUtil().setWidth(1020),
      child: Text(
        model.content,
        maxLines: 4,
        style: TextStyle(fontSize: ScreenUtil().setWidth(48)),
        textAlign: TextAlign.left,
      ),
    );
  }

  initPlayer(IjkMediaController controller) async {
    await controller.setNetworkDataSource(model.highUrl,
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

  Widget videoContent() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: ScreenUtil().setWidth(1020),
      height: ScreenUtil().setWidth(1020) * 486 / 864,
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              width: ScreenUtil().setWidth(1020),
              height: ScreenUtil().setWidth(1020) * 486 / 864,
              placeholder: kTransparentImage,
              image: model.picUrl,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.white.withOpacity(0.4),
                  width: ScreenUtil().setWidth(1020),
                  height: ScreenUtil().setWidth(1020) * 486 / 864,
                )),

//            Center(
//              child: AspectRatio(
//                aspectRatio: model.imageSize.s[0] / model.imageSize.s[1],
//                child: DefaultIJKControllerWidget(
//                  controller: controller,
//                  verticalGesture: false,
//                  horizontalGesture: false,
//                  playWillPauseOther: false,
//                  showFullScreenButton: false,
//                  currentFullScreenState: false,
//                ),
//              ),
//            ),
            Center(
              child: AspectRatio(
                aspectRatio: model.imageSize.s[0] / model.imageSize.s[1],
                child: IjkPlayer(
                  mediaController: controller,
                ),
              ),
            ),

            Center(
                child: GestureDetector(
                  onTap: () {
                    _isPlaying = !_isPlaying;
                    if (_isPlaying) {
//                  controller.pauseOtherController();
                      controller.ijkStatus == IjkStatus.noDatasource
                          ? initPlayer(controller)
                          : controller.play();
                      setState(() {});
                    } else {
                      controller.pause();
                    }
                  },
                  child: _isPlaying
                      ? Container(width: 0, height: 0)
                      : FadeInImage.memoryNetwork(
                    width: ScreenUtil().setWidth(1020),
                    height: ScreenUtil().setWidth(1020) * 486 / 864,
                    placeholder: kTransparentImage,
                    image: model.picUrl,
                    fit: BoxFit.fitHeight,
                  ),
                )
            )
          ],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget imageContent() {
    return Container(
        width: ScreenUtil().setWidth(1020),
        height: ScreenUtil().setWidth(1020) * 450 / 960,
        child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: model.highUrl,
            fit: BoxFit.cover));
  }

  Widget multiContent() {
    print(
        '-------------------${model.attachments[0].highUrl}-------${model
            .attachments.length}---------------');
    return Container(
      margin: EdgeInsets.all(20),
      width: ScreenUtil().setWidth(1060),
      height: (model.attachments.length / 3 +
          (model.attachments.length % 3 == 0 ? 0 : 1)) *
          ScreenUtil().setHeight(1060) /
          3,
      child: GridView.builder(
          padding: EdgeInsets.all(1),
          physics: NeverScrollableScrollPhysics(),
          itemCount: model.attachments.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount:
              model.attachments.length >= 3 ? 3 : model.attachments.length,
              //纵轴间距
              mainAxisSpacing: 2.0,
              //横轴间距
              crossAxisSpacing: 1.0,
              //子组件宽高长度比例
              childAspectRatio: 1),
          itemBuilder: (BuildContext context, int index) {
            //Widget Function(BuildContext context, int index)
            return Container(
              child: model.attachments[index].format == 'gif'
                  ? Image.asset('images/qbf_sign_shit_empty@3x.png')
                  : FadeInImage.assetNetwork(
                placeholder: 'images/qbf_sign_shit_empty@3x.png',
                image: 'http:${model.attachments[index].highUrl}',
                fit: BoxFit.cover,
                width: model.attachments.length >= 3
                    ? 3.0
                    : model.attachments.length.toDouble(),
              ),
            );
          }),
    );
  }

  Widget commentContent() {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10, right: 15),
      height: ScreenUtil().setHeight(120),
//      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Image.asset(isImmense
                      ? 'images/icon_for_active@3x.png'
                      : 'images/icon_for_immersive@3x.png'),
                  onTap: () {
                    if (!isImmense) {
                      setState(() {
                        isImmense = true;
                        isPain = false;
                      });
                    }
                  },
                ),
                Text(
                    '${isImmense
                        ? model.votes.up - model.votes.down + 1
                        : isPain ? model.votes.up - model.votes.down - 1 : model
                        .votes.up - model.votes.down}',
                    style: TextStyle(color: Colors.black54)),
                InkWell(
                  child: Image.asset(isPain
                      ? 'images/icon_against_active@3x.png'
                      : 'images/icon_against_immersive@3x.png'),
                  onTap: () {
                    if (!isPain) {
                      setState(() {
                        isImmense = false;
                        isPain = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Image.asset('images/button_comment@3x.png'),
                        Text('${model.commentsCount}',
                            style: TextStyle(color: Colors.black54))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Row(
                      children: <Widget>[
                        Image.asset('images/icon_my_article_more@3x.png'),
                        Text('${model.commentsCount}',
                            style: TextStyle(color: Colors.black54))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hotCommentContent() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
        alignment: AlignmentDirectional.centerStart,
        child: RichText(
            text: TextSpan(
                text: '${model.hotComment.user.login}:',
                style: TextStyle(color: Colors.black54),
                children: <TextSpan>[
                  TextSpan(
                    text: '${model.hotComment.content}',
                    style: TextStyle(color: Colors.black),
                  )
                ])));
  }
}
