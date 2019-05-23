import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:qiu_shi_bai_ke/config/service_method.dart';
import 'package:qiu_shi_bai_ke/model/home_model.dart';
import 'package:qiu_shi_bai_ke/pages/home_item_page/home_content_item_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeArticlePage extends StatefulWidget {
  @override
  HomeArticlePageState createState() => new HomeArticlePageState();
}

class HomeArticlePageState extends State<HomeArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset('images/comment_loading_empty_shit@3x.png',
              width: ScreenUtil.screenWidth / 10),
          Center(
            child: Text('关注列表为空'),
          ),
          Center(
            child: Text(
              '对你感兴趣的人，他们发布的糗事都在这里',
              style: TextStyle(
                  color: Colors.black54, fontSize: ScreenUtil().setSp(35)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
