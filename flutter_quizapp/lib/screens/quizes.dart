import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterquizapp/app_color/app_color.dart';
import 'package:flutterquizapp/res.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:share/share.dart';
class Quizes extends StatefulWidget {
  @override
  _QuizesState createState() => _QuizesState();
}
String answer = 'Pakistan';

class _QuizesState extends State<Quizes> {
  int itemCounter = 2;
  final primary = Constant.appColor;
  final btnback = Constant.btnBackground;
  SwiperController _controller = SwiperController();
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: Icon(Icons.close),
        title: Center(child: Text('Cricket')),
      ),
      body:  Container(
        color:Colors.white ,
        child: new Swiper(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          loop: false,
          itemBuilder: (BuildContext context,int index){
            return Container(
              height: 600,
              color: index==itemCounter?primary:Colors.white,
              child: ListView(
                children: <Widget>[
                  Container(
                    height:510,

                    child:index==itemCounter?Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: new Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              Image.asset(Res.partylogo,width: 50,height: 50,),Text('Congratulations',style: TextStyle(color: Color(0xff6DBD93),fontSize: 16,fontWeight: FontWeight.bold),),Image.asset(Res.partylogo)
                            ],),
                            Text('You have got ${18} out of right in the'),
                            Text('topic of Political'),
                            SizedBox(height: 25,),
                            Padding(
                              padding: const EdgeInsets.only(left:25.0),
                              child: new LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 15.0,
                                percent: 0.8,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),

                            ),
                        SizedBox(height: 25,),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: btnback),
                          child: FlatButton(
                            child: Text(
                              "Share",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            onPressed: () {
                              Share.share('check out my website https://example.com');
                            },
                          ),)
                          ],
                        ),
                      ),
                    ): new Card(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Question No ${index+1}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('${index} This is some dummy Text I am testing here to see the output result of swiper library if its work fine or not asd asda asda dsafasfa  fas fasffasf asf as fas '),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(height: 15,color: primary,),
                          ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Chose Answer',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(width: 100,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Wrong/Correct',textAlign: TextAlign.start,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
                        ),
                      ],
                    ),
                        Container(
                          height: 320,
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                  height:80,
                                  decoration:BoxDecoration(
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16.0),
                                          child: Image.asset(
                                            Res.one,
                                            height: 40.0,
                                            width: 40.0,
                                          ),
                                        ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left:18.0),
                                        child: GestureDetector(
                                          onTap: (){

                                          },
                                          child: Text(
                                            'Pakistan',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black87),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16.0),
                                            child: Image.asset(
                                              Res.two,
                                              height: 40.0,
                                              width: 40.0,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:18.0),
                                          child: GestureDetector(
                                            onTap: (){

                                            },
                                            child: Text(
                                              'England',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16.0),
                                            child: Image.asset(
                                              Res.three,
                                              height: 40.0,
                                              width: 40.0,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:18.0),
                                          child: GestureDetector(
                                            onTap: (){

                                            },
                                            child: Text(
                                              'India',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black87),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Image.asset(
                                            Res.four,
                                            height: 40.0,
                                            width: 40.0,
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:18.0),
                                          child: GestureDetector(
                                            onTap: (){

                                            },
                                            child: Text(
                                              'South Africa',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        index==itemCounter?Container():Padding(
                          padding: const EdgeInsets.only(right:15.0),
                          child: RawMaterialButton(
                            onPressed: () {
                              _controller.move(++_i % 3);
                            },
                            elevation: 2.0,
                            fillColor: Colors.orange,
                            child: Row(
                              children: <Widget>[
                              Text('NEXT',style: TextStyle(color: Colors.white),),
                                SizedBox(width: 5,),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(15.0),

                          ),
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
