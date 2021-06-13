import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../detail_page.dart';

class Body extends StatefulWidget {
  String sortBy;
  Body({this.sortBy});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  @override
  Widget build(BuildContext context) {
    
  final Stream<QuerySnapshot> _postStream =
      FirebaseFirestore.instance.collection('posts').orderBy(widget.sortBy).snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _postStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return newsEntry(document.data(), context);
          }).toList(),
        );
      },
    );
  }
}

Widget newsEntry(data, context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(
        DetailPage.tag,
        arguments: data,
      );
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        children: [
          // Date and author text row
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
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    //data['categories'],
                    '',
                    maxLines: 1,
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
          //Rating, Seen, Comments Icon Row
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.view_column_rounded,
                          color: Colors.grey[700],
                        ),
                      ),
                      Container(
                        child: Text(
                          data['rating'] == 0
                              ? '--'
                              : data['rating'].toString(),
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.grey[700],
                        ),
                      ),
                      Container(
                        child: Text(
                          data['seen'].toString(),
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.comment_bank_rounded,
                          color: Colors.grey[700],
                        ),
                      ),
                      Container(
                        child: Text(
                          data['comments'].toString(),
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[700],
          )
        ],
      ),
    ),
  );
}
