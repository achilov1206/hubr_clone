import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static String tag = 'search-page';
  @override
  _SearchPageState createState() => _SearchPageState();
}

enum SearchFilterConditions { byRelevance, byDate, byRating }

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff62858F),
        title: TextFormField(
          autofocus: true,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Поиск',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<SearchFilterConditions>(
            icon: Icon(Icons.filter_list),
            onSelected: (result) => {setState(() {})},
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SearchFilterConditions>>[
              const PopupMenuItem<SearchFilterConditions>(
                value: SearchFilterConditions.byRelevance,
                child: Text('По релевантности'),
              ),
              const PopupMenuItem<SearchFilterConditions>(
                value: SearchFilterConditions.byDate,
                child: Text('По дате'),
              ),
              const PopupMenuItem<SearchFilterConditions>(
                value: SearchFilterConditions.byRating,
                child: Text('По рейтингу'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/search.jpg',
              width: 100,
              height: 100,
            ),
            Text('Введите поисковый запрос'),
          ],
        ),
      ),
    );
  }
}
