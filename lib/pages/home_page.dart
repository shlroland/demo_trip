import 'package:demo_trip/dao/home_dao.dart';
import 'package:demo_trip/model/home_model.dart';
import 'package:demo_trip/widget/loading_container.dart';
import 'package:demo_trip/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../model/common_model.dart';

const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  double appBarAlpha = 0;
  List<CommonModel> bannerList = [];
  @override
  void initState() {
    // TODO: implement initState
    _handleRefresh();
    super.initState();
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        bannerList = model.bannerList;
        _loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: NotificationListener(
                    // ignore: missing_return
                    onNotification: (scrollNotification) {},
                    child: _listView,
                  ),
                ),
              ),
              _appBar
            ],
          ),
        )
        // body: Lo,
        );
  }

  Widget get _listView {
    return ListView(
      children: [_banner],
    );
  }

  Widget get _appBar {
    return Column(children: <Widget>[
      Container(
        decoration: BoxDecoration(),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          height: 80.0,
          decoration: BoxDecoration(
              color:
                  Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255)),
          child: SearchBar(
            searchBarType: appBarAlpha > 0.2
                ? SearchBarType.homeLight
                : SearchBarType.home,
            inputBoxClick: () {},
            speakClick: () {},
            defaultText: SEARCH_BAR_DEFAULT_TEXT,
            leftButtonClick: () {},
          ),
          // child: ,
        ),
      )
    ]);
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Image.network(
              bannerList[index].icon,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
