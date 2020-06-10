import 'package:flutter/material.dart';
import 'package:flutterquizapp/app_color/app_color.dart';

class Dynamic_topic_list extends StatefulWidget {
  @override
  _Dynamic_topic_listState createState() => _Dynamic_topic_listState();
}
final primary = Constant.appColor;
List<Map> Chapters = [];
List<Map> _filteredList = List();
class _Dynamic_topic_listState extends State<Dynamic_topic_list> {
  //Assigning values to filter list
  _filterItems(String val) {
    _filteredList.clear();
    for (var i in Chapters) {
      var name = i['username'].toString().toLowerCase();
      if (name == val || name.contains(val)) {
        _filteredList.add(i);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child:
            Stack(
                children: <Widget>[
                  Container(
                    height: 300,
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextField(
                              onChanged: (val) {
                                _filterItems(val);
                              },
                              // controller: TextEditingController(text: locations[0]),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                  hintText: "Search here",
                                  hintStyle: TextStyle(
                                      color: Colors.black38, fontSize: 16),
                                  prefixIcon: Material(
                                    elevation: 0.0,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                    child: Icon(Icons.search),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 13)),
                            ),

                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            'Dynamic Topic',
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
                            'Book Name',
                            style:
                            TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(right: 220.0, top: 10),
                          child: Text(
                            '20+ Chapters',
                            style:
                            TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:28.0,top: 15),
                              child: Text(
                                '4.5',
                                style:
                                TextStyle(color: Colors.orange, fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:28.0,top: 15),
                              child: Text(
                                '{Reviews}',
                                style:
                                TextStyle(color: Colors.white60, fontSize: 12),
                              ),
                            ),],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:200.0,top: 15),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.orange)),
                            onPressed: () {},
                            color: Colors.orange,
                            textColor: Colors.white,
                            child: Text("Explained Videos",
                                style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],

                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:180.0,top: 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          'https://image.freepik.com/free-vector/abstract-dynamic-pattern-wallpaper-vector_53876-59131.jpg',
                          height: 230.0,
                          width: 150.0,
                          fit:BoxFit.fill
                      ),
                    ),
                  ),


                ]),
          ),


          Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 500,

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
                                scrollDirection: Axis.vertical,
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

  Widget dynamicBuildList(BuildContext context, int index) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  'https://image.freepik.com/free-vector/abstract-dynamic-pattern-wallpaper-vector_53876-59131.jpg',
                  height: 40.0,
                  width: 40.0,
                ),
              ),
            ),
            Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Text(
                    'Chapter 1 - Some Dumy Text',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '20+ Chapters ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:50.0),
              child: Icon(Icons.arrow_forward_ios, size: 25,color: Colors.grey,),
            ),

          ],
        ),
      ),
    );
  }

}
