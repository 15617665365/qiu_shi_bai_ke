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

//class HomeContentPage1 extends StatelessWidget {
//  final int currentIndex;
//  List dataList = [];
////  HomeContentPage({Key key, this.currentIndex}) : super(key: key);
//
//  HomeContentPage1(this.currentIndex);
//
//  @override
//  Widget build(BuildContext context) {
////    _initHomeList(context);
////    return Provide<HomeContentProvide>(builder: (context, child, data) {
////      print('eeee${currentIndex}-------${data.selectIndex}');
////      return EasyRefresh(
////        child: ListView.builder(
////          itemBuilder: (content, index) {
////            return HomeContentItemPage(data.homeList[index]);
////          },
////          padding: EdgeInsets.all(0),
////          itemCount: data.homeList.length,
////        ),
////        loadMore: () {
////          _getHomeList(context, 2);
////        },
////        onRefresh: () {
////          _getHomeList(context, 1);
////        },
////      );
////    });
//    print('======1====${currentIndex}--------');
////    if(currentIndex == 1){
//      return FutureBuilder(
//        future: _initHomeList(context),
//        builder: (context, data) {
//          print('=====2=====${data}--------');
//          return EasyRefresh(
//            child: ListView.builder(
//              itemBuilder: (content, index) {
//                return HomeContentItemPage(
//                    Provide.value<HomeContentProvide>(context).homeList[index]);
//              },
//              padding: EdgeInsets.all(0),
//              itemCount:
//              Provide.value<HomeContentProvide>(context).homeList.length,
//            ),
//            loadMore: () {
//              _getHomeList(context, 2);
//            },
//            onRefresh: () {
//              _getHomeList(context, 1);
//            },
//          );
//        },
//      );
////    }else{
////      return Text('22222');
////    }
//  }
//
//  void _getHomeList(context, int type) async {
//    await request(selectRequest()).then((val) {
//      var data = json.decode(val);
//      print(data);
//      HomeModel homeList = HomeModel.fromJson(data);
//      Provide.value<HomeContentProvide>(context)
//          .getHomeInfo(homeList.items, type);
//    });
//  }
//
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
//
//  String selectRequest() {
//    String url = '';
//    switch (currentIndex) {
//      case 0:
//        url = 'homePageArticleContent';
//        break;
//      case 1:
//        url = 'homePageContent';
//        break;
//      case 2:
//        url = 'homePageVideoContent';
//        break;
//      case 3:
//        url = 'homePageTextContent';
//        break;
//      case 4:
//        url = 'homePageImageContent';
//        break;
//      case 5:
//        url = 'homePageDayContent';
//        break;
//      case 6:
//        url = 'homePageaRticleContent';
//        break;
//    }
//    return url;
//  }
//}

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHomeList(context, 1);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
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
