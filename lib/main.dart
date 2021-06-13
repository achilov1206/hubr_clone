import 'package:flutter/material.dart';
import './home_page.dart';
import './login_page.dart';
import './search_page.dart';
import './detail_page.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    LoginPage.tag: (context) => LoginPage(),
    SearchPage.tag: (context) => SearchPage(),
    DetailPage.tag: (context) => DetailPage(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Center(
              child: Text('Connection wrong'),
            ),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hubr Clone',
            theme: ThemeData(
                // brightness: Brightness.dark,
                // primaryColor: Colors.lightBlue[800],
                // accentColor: Colors.cyan[600],
                // primarySwatch: Colors.blue,
                ),
            home: HomePage(),
            routes: routes,
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Center(
            child: Text('Something went wrong'),
          ),
        );
      },
    );
  }
}
