import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];

  double _topViewOpacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  _changeTopByScroll(scrollNotification);
                  return false;
                },
                child: ListView(
                  children: [
                    Container(
                      height: 160,
                      child: Swiper(
                        autoplay: true,
                        itemCount: _imageUrls.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 600,
                      child: Center(
                        child: Text("hahah"),
                      ),
                    )
                  ],
                ),
              )),
          Opacity(
            opacity: _topViewOpacity,
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(child: Text("首页头部")),
            ),
          ),
        ],
      ),
    );
  }

  void _changeTopByScroll(scrollNotification) {
    if (scrollNotification is ScrollUpdateNotification &&
        scrollNotification.depth == 0) {
      double pixels = scrollNotification.metrics.pixels;
      double tempAlp = pixels / APPBAR_SCROLL_OFFSET;
      if (tempAlp < 0) {
        tempAlp = 0;
      } else if (tempAlp > 1) {
        tempAlp = 1;
      }
      setState(() {
        _topViewOpacity = tempAlp;
      });
    }
  }
}
