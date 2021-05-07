import 'package:demo_trip/dao/home_dao.dart';
import 'package:demo_trip/model/home_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    _handleRefresh();
    super.initState();
  }

  _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      print('model');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('home'),);
  }
}
