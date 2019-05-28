import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:qiu_shi_bai_ke/provides/home_content_provide.dart';
import 'package:qiu_shi_bai_ke/config/service_method.dart';
import 'package:qiu_shi_bai_ke/model/home_model.dart';
import 'package:qiu_shi_bai_ke/pages/home_item_page/home_content_item_page.dart';


import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';


class HomeContentPage extends StatefulWidget {
  int currentIndex;

  HomeContentPage(this.currentIndex);

  @override
  HomeContentPageState createState() => new HomeContentPageState(currentIndex);
}

class HomeContentPageState extends State<HomeContentPage> {
  final int currentIndex;

  List<Items> dataList = [];

  HomeContentPageState(this.currentIndex);

  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHomeList(context, 1);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      key: _easyRefreshKey,
      refreshHeader: MaterialHeader(
        key: _headerKey,
      ),
      refreshFooter: MaterialFooter(
        key: _footerKey,
      ),
      child: ListView.builder(
        itemBuilder: (content, index) {
          return HomeContentItemPage(dataList[index]);
        },
        padding: EdgeInsets.all(0),
        itemCount: dataList.length,
      ),
      loadMore: () {
        _getHomeList(context, 2);
      },
      onRefresh: () {
        _getHomeList(context, 1);
      },
    );
  }

  void _getHomeList(context, int type) async {
    await request(selectRequest()).then((val) {
      print('dddd');
      var data = json.decode(val.toString());
      print(data);
      HomeModel homeList = HomeModel.fromJson(data);
      setState(() {
        if(type == 2){
          dataList.addAll(homeList.items);
        }else{
          dataList = homeList.items;
        }
      });
//      Provide.value<HomeContentProvide>(context)
//          .getHomeInfo(homeList.items, type);
    });
  }

//  Future _initHomeList(context) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String homeListStr = prefs.getString('home${currentIndex}');
//    if (homeListStr == null) {
//      _getHomeList(context, 1);
//    } else {
//      Provide.value<HomeContentProvide>(context).getHomeInfo([], 0);
//    }
//    return Provide.value<HomeContentProvide>(context).homeList;
//  }

  String selectRequest() {
    String url = '';
    switch (currentIndex) {
      case 0:
        url = 'homePageArticleContent';
        break;
      case 1:
        url = 'homePageContent';
        break;
      case 2:
        url = 'homePageVideoContent';
        break;
      case 3:
        url = 'homePageTextContent';
        break;
      case 4:
        url = 'homePageImageContent';
        break;
      case 5:
        url = 'homePageDayContent';
        break;
      case 6:
        url = 'homePageaRticleContent';
        break;
    }
    return url;
  }
}
