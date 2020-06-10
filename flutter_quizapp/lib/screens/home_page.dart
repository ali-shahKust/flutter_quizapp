import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterquizapp/screens/quizes.dart';

import 'initial_Screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Object> _tabs;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _tabs  = [Initial_screen(),Quizes()];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 55,
        backgroundColor: Colors.white,
        color: Colors.blueAccent,
        items: <Widget>[

          Icon(Icons.home, size: 25,color: Colors.white,),
          Icon(Icons.help, size: 25,color: Colors.white),
          Icon(Icons.search,size: 25,color: Colors.white),
          Icon(Icons.bookmark, size: 25,color: Colors.white),
          Icon(Icons.settings, size: 25,color: Colors.white),
          Icon(Icons.share, size: 25,color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _tabs[_page]
    );
  }
}
