import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  static String tag = 'login-page';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff62858F),
        title: Text(
          'Авторизация',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'E-mail',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Пароль',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Войти',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff62858F),
                        padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Center(
                child: Text(
                  'или зайдите через',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 40,
                    color: Color(0xff62858F),
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 40,
                    color: Color(0xff62858F),
                    icon: FaIcon(FontAwesomeIcons.vk),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 40,
                    color: Color(0xff62858F),
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 40,
                    color: Color(0xff62858F),
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 40,
                    color: Color(0xff62858F),
                    icon: FaIcon(FontAwesomeIcons.microsoft),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'ЗАРЕГИСТРИРОВАТЬСЯ',
                    style: TextStyle(
                      color: Color(0xff62858F),
                      fontSize: 15,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'ЗАБЫЛИ ПАРОЛЬ?',
                    style: TextStyle(
                      color: Color(0xff62858F),
                      fontSize: 15,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
