import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_page.dart';
import 'dynamic_page.dart';
import 'live_page.dart';
import 'message_page.dart';
import 'me_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/currentIndex.dart';


class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> BottomTabs = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/icon_main@3x.png',
          width: 30,
        ),
        activeIcon: Image.asset(
          'images/icon_main_active@3x.png',
          width: 30,
        ),
        title: Text('糗事')),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/main_tab_qbfriends@3x.png',
          width: 30,
        ),
        activeIcon: Image.asset(
          'images/main_tab_qbfriends_active@3x.png',
          width: 30,
        ),
        title: Text('动态')),
    BottomNavigationBarItem(
      icon: Image.asset(
        'images/main_tab_live@3x.png',
        width: 30,
      ),
      activeIcon: Image.asset(
        'images/main_tab_live_active@3x.png',
        width: 30,
      ),
      title: Text('直播'),
    ),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/icon_chat@3x.png',
          width: 30,
        ),
        activeIcon: Image.asset(
          'images/icon_chat_active@3x.png',
          width: 30,
        ),
        title: Text('小纸条')),
    BottomNavigationBarItem(
        icon: Image.asset(
          'images/icon_me@3x.png',
          width: 30,
        ),
        activeIcon: Image.asset(
          'images/icon_me_active@3x.png',
          width: 30,
        ),
        title: Text('我'))
  ];

  final List<Widget> tabBodies = [
    Homepage(),
    DynamicPage(),
    LivePage(),
    MessagePage(),
    MePage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);

    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1),
          bottomNavigationBar: BottomNavigationBar(
            items: BottomTabs,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}
