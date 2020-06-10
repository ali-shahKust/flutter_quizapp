import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterquizapp/app_color/app_color.dart';

class Mytopic_Pages extends StatefulWidget {
  @override
  _Mytopic_PagesState createState() => _Mytopic_PagesState();
}

class _Mytopic_PagesState extends State<Mytopic_Pages> {
  int itemCounter = 2;
  final primary = Constant.appColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: Icon(Icons.close),
        title: Center(child: Text('Cricket')),
      ),
      body:  Container(
        color:primary ,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: new Swiper(
            loop: false,
            itemBuilder: (BuildContext context,int index){
              return Container(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height:380,

                      child: new Card(
                        child: index==itemCounter?Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Recollect what you learn in ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
                            Center(child: Text('Cricket ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),)),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: _buildTextField()
                            )
                          ],
                        ):Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Fielder',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('${index} This is some dummy Text I am testing here to see the output result of swiper library if its work fine or not asd asda asda dsafasfa  fas fasffasf asf as fas '),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.orange,
                              child: Icon(
                                Icons.save_alt,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.orange,
                            child: Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: itemCounter+1,

           //pagination: new SwiperPagination(),
           //control: new SwiperControl(),
            itemWidth: 300.0,
            itemHeight: 400.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    final maxLines = 8;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(

        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter a message",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
