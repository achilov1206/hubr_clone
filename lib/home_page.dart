import 'package:flutter/material.dart';

import './widgets/drawer.dart';
import './widgets/appbar.dart';
import './widgets/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _sortby = 'created';
  void sortBy(sort) {
    setState(() {
      _sortby = sort;
    });
  }

  set sortby(String value) => setState(() => _sortby = value);

  @override
  Widget build(BuildContext context) {
    print(_sortby);
    return Scaffold(
      appBar: MyAppBar(sortBy:sortBy), //widgets/appbar.dart
      body: Body(sortBy: _sortby), //widgets/body.dart
      drawer: myDrawer(context),  //widgets/drawer.dart
    );
  }
}
