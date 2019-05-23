import 'package:flutter/material.dart';
import '../config/service_method.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_item_page/home_content_page.dart';

import 'package:provide/provide.dart';
import 'package:qiu_shi_bai_ke/provides/home_content_provide.dart';
import 'package:qiu_shi_bai_ke/pages/home_item_page/home_article_page.dart';

class Homepage extends StatefulWidget {
  @override
  HomepageState createState() => new HomepageState();
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController mTabController;
//  PageController mPageController = PageController(initialPage: 1);
  List<TabTitle> tabList;
  var currentPage = 0;
  var isPageCanChanged = true;

  List<Widget> pageViewList = [
    HomeArticlePage(),
    HomeContentPage(1),
    HomeContentPage(2),
    HomeContentPage(3),
    HomeContentPage(4),
    HomeContentPage(5),
//    HomeContentPage(6),
  ];

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: <Widget>[
            _searchWdget(),
            Container(
              color: Color(0xfff4f5f6),
              height: 38.0,
              child: TabBar(
                isScrollable: true,
                //是否可以滚动
                controller: mTabController,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xff666666),
//                indicatorColor: Colors.orange,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.orange, width: 4),
                    insets: EdgeInsets.only(bottom: 12)),
                indicatorWeight: 4,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(fontSize: ScreenUtil().setSp(48)),
                tabs: tabList.map((item) {
                  return Tab(
                    text: item.title,
                  );
                }).toList(),
              ),
            ),
            Expanded(
                child: TabBarView(
                  controller: mTabController,
                    children: pageViewList.map((tab) {
              return tab;
            }).toList()))
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initTabData();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.index = 1;
//    mTabController.addListener(() {
//      //TabBar的监听
//      if (mTabController.indexIsChanging) {
//        //判断TabBar是否切换
//        onPageChange(mTabController.index, p: mPageController);
//      }
//    });
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
//    mPageController.dispose();
  }

  Widget _searchWdget() {
    return Container(
//      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(150),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setHeight(25), 19, ScreenUtil().setHeight(20), 10),
            width: ScreenUtil().setWidth(150),
            child: InkWell(
              child: Image.asset('images/qbf_sign_in@3x.png'),
              onTap: () {},
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(730),
            margin: EdgeInsets.fromLTRB(0, 11, 0, 5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset('images/home_search_icon@3x.png'),
                  Text(
                    ' 搜索糗事',
                    style: TextStyle(color: Colors.black45),
                  )
                ],
              ),
            ),
          ),
          Container(
//            margin: EdgeInsets.fromLTRB(0, 19, 9, 0),
            child: InkWell(
              child: Image.asset(
                'images/icon_post_new@3x.png',
                width: ScreenUtil().setWidth(150),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  initTabData() {
    tabList = [
      TabTitle('关注', 0),
      TabTitle('专享', 1),
      TabTitle('视频', 2),
      TabTitle('纯文', 3),
      TabTitle('纯图', 4),
      TabTitle('精华', 5),
//      TabTitle('爆社', 6),
    ];
  }
}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}
