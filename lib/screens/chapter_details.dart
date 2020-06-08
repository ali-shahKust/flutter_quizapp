import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class ChapterDetail extends StatefulWidget {
  String title='';
  String topic='';
  String link= '';
  String pickedFile;
  ChapterDetail(this.title, this.topic,this.link,  this.pickedFile);

  @override
  _ChapterDetailState createState() => _ChapterDetailState(title,topic,link,pickedFile);
}

class _ChapterDetailState extends State<ChapterDetail> {
  String title='';
  String topic='';
  String link= '';
  String pickedFile;

  var _chapterContentController= TextEditingController();
  bool _validate = false;
  var _questionController = TextEditingController();
  var _oneController = TextEditingController();
  var _twoController = TextEditingController();
  var _threeController = TextEditingController();
  var _fourController = TextEditingController();
  _ChapterDetailState(this.title,this.topic,this.link,this.pickedFile);

  @override
  Widget build(BuildContext context) {

    print('file path $pickedFile');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6964FF),
        title: Text(title),
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(height: 25,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                maxLines: 7,
                controller: _chapterContentController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "Type Chapter Content",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _questionController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    hintText: "Type Question here",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),

          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _oneController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "Option one",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _twoController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "Option two",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _threeController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "Option three",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _fourController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "Option four",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(height: 20.0),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32,vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xff6964FF)),
                child: FlatButton(
                    child: Text(
                      "Upload Chapter".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        _questionController.text.isEmpty ? _validate = true : _validate = false;
                      });

                      _validate==false?
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "",
                        desc: "Chapter Has been Uploaded Successfully",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Okay",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show():Fluttertoast.showToast(
                          msg: "Please Check Fields",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.grey.shade300,
                          textColor: Colors.black,
                          fontSize: 16.0
                      );
                    }
                ),
              )),
        ],
      ),
    );
  }
}
