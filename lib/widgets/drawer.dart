import 'package:flutter/material.dart';
import '../login_page.dart';
import '../home_page.dart';

Widget myDrawer(context) => Drawer(
  child: ListView(
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xff62858F),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LoginPage.tag);
            },
            child: Row(
              children: <Widget>[
                Text(
                  'Войти',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_right_alt_sharp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        title: Text(
          'Публикации',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.filter,
          color: Colors.grey[10],
        ),
      ),
      ListTile(
        title: Text(
          'Хабы',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.table_chart_sharp,
          color: Colors.grey[10],
        ),
        onTap: () {},
      ),
      Divider(
        height: 10,
        color: Colors.black,
      ),
      ListTile(
        title: Text(
          'Настройки',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Icon(
          Icons.settings,
          color: Colors.grey[10],
        ),
        onTap: () {
          
        },
      ),
    ],
  ),
);
