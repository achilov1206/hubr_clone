import 'package:flutter/material.dart';
import '../search_page.dart';
import '../home_page.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function sortBy;
  MyAppBar({Key key, this.sortBy})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  String dropDownValue = 'created';

  Map<String, String> _options = {
    'rating': 'Лучшие',
    'seen': 'Интересные',
    'created': 'Все подряд',
  };

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff62858F),
      elevation: 20,
      shadowColor: Colors.grey,
      title: Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: dropDownValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 25,
            ),
            iconSize: 24,
            elevation: 2,
            selectedItemBuilder: (BuildContext context) {
              return _options
                  .map((String key, String value) {
                    print(key);
                    print(value);
                    return MapEntry(
                      key,
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    );
                  })
                  .values
                  .toList();
            },
            //underline:,
            items: _options
                .map(
                  (String key, String value) {
                    return MapEntry(
                      key,
                      DropdownMenuItem<String>(
                        value: key,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                )
                .values
                .toList(),
            onChanged: (String newValue) {
              widget.sortBy(newValue);
              setState(() {
                dropDownValue = newValue;
              });
            },
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(SearchPage.tag);
          },
        )
      ],
    );
  }
}
