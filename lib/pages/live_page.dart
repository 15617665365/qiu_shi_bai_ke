import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qiu_shi_bai_ke/config/service_method.dart';
import 'package:qiu_shi_bai_ke/model/live_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'live_details_page/banners_web.dart';

import 'live_details_page/live_details.dart';

class LivePage extends StatefulWidget {
  @override
  LivePageState createState() => LivePageState();
}

class LivePageState extends State<LivePage>
    with SingleTickerProviderStateMixin {
  List<Banners> bannersList = [];
  List<Lives> livesList = [];
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRequest();
  }

  void _getRequest() async {
    await request('homePagealLive').then((val) {
      var data = json.decode(val.toString());
      LiveModel liveModel = LiveModel.fromJson(data);

      setState(() {
        bannersList = liveModel.banners;
        livesList = liveModel.lives;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('直播'),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child:
                bannersList.length == 0 ? Container() : _buildHeader(bannersList),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 0.85,
            children: livesList.map((lives) {
              return livesList.length==0?Container():_buildItemGrid(lives);
//            return Container(child: Text('222'),);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(List<Banners> bannersList) {
    print("=================${bannersList[0].redirectUrl}");
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: bannersList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BannersWeb(
                            url: bannersList[index].redirectUrl,
                          )));
//              Application.router.navigateTo(context,
//                  '/bannersWeb?url=${bannersList[index].redirectUrl}');
            },
            child: Image.network(bannersList[index].url),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  Widget _buildItemGrid(Lives lives) {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LiveDetails(
                    url: lives.rtmpLiveUrl,
                  )));
        },
          child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                child: Image.network(lives.author.headurl, fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              Positioned(
                left: 5,
                bottom: 5,
                child: Text(
                  lives.content == null ? '' : lives.content,
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Text(
                  lives.location == null ? '' : lives.location,
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(' ${lives.author.name}',
                style: TextStyle(
                    color: Colors.black45, fontSize: ScreenUtil().setSp(33))),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(' ${lives.accumulatedCount}人',
                style: TextStyle(
                    color: Colors.black45, fontSize: ScreenUtil().setSp(33))),
          )
        ],
      )),
    );
  }
}
