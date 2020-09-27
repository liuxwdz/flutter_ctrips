import 'package:flutter/material.dart';
import 'package:flutter_ctrips/pages/home_page.dart';
import 'package:flutter_ctrips/pages/lvpa_page.dart';
import 'package:flutter_ctrips/pages/my_page.dart';
import 'package:flutter_ctrips/pages/search_page.dart';

class TabNavigatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorWidgetState();
}

class _TabNavigatorWidgetState extends State<TabNavigatorWidget> {
  var _curIndex;

  PageController controller;

  final Color selColor = Colors.blue[300];
  final Color unSelColor = Colors.grey[300];

  @override
  void initState() {
    super.initState();
    _curIndex = 0;
    controller = PageController(initialPage: _curIndex);
  }

  @override
  Widget build(BuildContext context) {
    return _getWidget(context);
  }

  Widget _getWidget(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [HomePage(), SearchPage(), LvPaPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            _curIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: unSelColor),
              activeIcon: Icon(Icons.home, color: selColor),
              title: Text(
                "首页",
                style: TextStyle(color: _curIndex == 0 ? selColor : unSelColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: unSelColor),
              activeIcon: Icon(Icons.search, color: selColor),
              title: Text(
                "搜索",
                style: TextStyle(color: _curIndex == 1 ? selColor : unSelColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, color: unSelColor),
              activeIcon: Icon(Icons.camera, color: selColor),
              title: Text(
                "旅拍",
                style: TextStyle(color: _curIndex == 2 ? selColor : unSelColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: unSelColor),
              activeIcon: Icon(Icons.account_circle, color: selColor),
              title: Text(
                "我的",
                style: TextStyle(color: _curIndex == 3 ? selColor : unSelColor),
              ))
        ],
      ),
    );
  }
}
