import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dynamic_viewpager_detail.dart';

class Dynamic_Chapter_Details extends StatefulWidget {
  @override
  _Dynamic_Chapter_DetailsState createState() => _Dynamic_Chapter_DetailsState();
}

class _Dynamic_Chapter_DetailsState extends State<Dynamic_Chapter_Details> {

  String videoURL = "https://www.youtube.com/watch?v=n8X9_MgEdCg";

  YoutubePlayerController _controller;

  @override
  void initState() {

    _controller = YoutubePlayerController(
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
        ),
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Chapter Name')),
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 20),
                  child: Text('Explainatory Video',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,top: 20),
                  child: Text('Subtopics',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87
                  ),),
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
          )
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
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Mytopic_Pages()));
                    },
                    child: Text(
                      'Chapter Name',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:18.0,top: 5),
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
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () {},
                color: Colors.orange,
                textColor: Colors.white,
                child: Text("Take Quiz".toUpperCase(),
                    style: TextStyle(fontSize: 10)),
              ),
            ),

          ],
        ),
      ),
    );
  }


}
