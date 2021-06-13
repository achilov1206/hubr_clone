import 'package:flutter/material.dart';
import 'package:hubr_clone/home_page.dart';

class DetailPage extends StatelessWidget {
  static String tag = 'detail-page';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = new Map<String, dynamic>.from(
        ModalRoute.of(context).settings.arguments);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff62858F),
          elevation: 20,
          shadowColor: Colors.grey,
          title: Text(
            'Публкации',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.share),
            ),
          ],
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                //Date and author text Row
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          (data['created'].seconds).toString(),
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text(
                          data['author'],
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
                //Title Text Row
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          data['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Categories Text Row
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          //data['categories'],
                          '',
                          maxLines: 4,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Content Text Row
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(data['content']),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 2,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.view_column_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank_rounded),
              label: '',
            ),
          ],
        ));
  }
}
