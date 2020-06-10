import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterquizapp/app_color/app_color.dart';

class Initial_screen extends StatefulWidget {
  @override
  _Initial_screenState createState() => _Initial_screenState();
}

final primary = Constant.appColor;
List<Map> Posts = [];
final List <Map> News = [];
class _Initial_screenState extends State<Initial_screen> {
  final databaseRef = Firestore.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnewsData();
    getDynamicData();
  }

  final List<Map> LawyerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 220.0, top: 30),
                            child: Text(
                              'Recent News',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: News.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return buildHorizontal(context, index);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),

          //Static Topics
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Static Topics',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                width: 130,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () {},
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("4 topics".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
       Container(
       child: Column(
         children: <Widget>[
           Stack(
             children: <Widget>[
               Container(
                 height: 250,

                 width: double.infinity,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(30),
                       bottomLeft: Radius.circular(30),
                     )),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     SizedBox(
                       height: 15,
                     ),
                     Expanded(
                       child: ListView.builder(
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           itemCount: 15,
                           itemBuilder: (BuildContext context, int index) {
                             return staticBuildList(context, index);
                           }),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ],
       ),
       ),


         //Dynamic Topic
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Dynamic Topics',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                width: 130,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () {},
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("4 topics".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 250,

                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 15,
                                itemBuilder: (BuildContext context, int index) {
                                  return dynamicBuildList(context, index);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget buildHorizontal(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              News[index]['newsheader'],
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20),
          child: Text(
            News[index]['newstitle'],
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 125.0, left: 20, right: 2),
          child: Container(
              width: 150,
              height: 90,
              child: Text(
                News[index]['newsdescription'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }


  Widget staticBuildList(BuildContext context, int index) {
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    'https://image.freepik.com/free-vector/abstract-dynamic-pattern-wallpaper-vector_53876-59131.jpg',
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
              ),
              Text(
                'Topic Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '20+ Chapters ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget dynamicBuildList(BuildContext context, int index) {
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    'https://image.freepik.com/free-vector/abstract-dynamic-pattern-wallpaper-vector_53876-59131.jpg',
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
              ),
              Text(
                'Topic Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '20+ Chapters ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  void getDynamicTopics() async {

  }
  void getnewsData() async{
    try{
      databaseRef.collection("News")
          .getDocuments()
          .then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((f){
          News.add(f.data);
          print('snaps data ${f.data}');
        });
        setState(() {});
      });
    }catch(e){
      print('get me error ${e.message}');
    }
  }

  void getDynamicData() async{
    try{
      databaseRef.collection("Dynamic")
          .getDocuments()
          .then((QuerySnapshot snapshot) {
        snapshot.documents.forEach((f){
          Posts.add(f.data);
          print('snaps data ${f.data}');
        });
        setState(() {});
      });
    }catch(e){
      print('get me error ${e.message}');
    }
  }

}

