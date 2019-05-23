import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:qiu_shi_bai_ke/model/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeContentProvide with ChangeNotifier {
  int selectIndex = 1;

  List<Items> homeList = [];
  String homeListStr = '[]';


  getHomeInfo(List<Items> list, int type) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    homeListStr = prefs.getString('home${selectIndex}');

    if(type == 0){
      List<Map> tempList = (json.decode(homeListStr.toString()) as List).cast();
      tempList.forEach((item) {
        Items itemModel = Items.fromJson(item);
        homeList.add(itemModel);
      });
    } else if(type == 1) {
      homeList = list;
    } else if(type == 2) {
      List<Map> tempList = (json.decode(homeListStr.toString()) as List).cast();
      tempList.forEach((item) {
        Items itemModel = Items.fromJson(item);
        homeList.add(itemModel);
      });
      homeList.addAll(list);
    }

    homeListStr = json.encode(homeList).toString();
    prefs.setString('home${selectIndex}', homeListStr);
    notifyListeners();

  }

}

