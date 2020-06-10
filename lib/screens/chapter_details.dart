import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';


class ChapterDetail extends StatefulWidget {
  String title='';
  String topic='';
  String link= '';
  File _imageFile;
  ChapterDetail(this.title, this.topic,this.link,  this._imageFile);

  @override
  _ChapterDetailState createState() => _ChapterDetailState(title,topic,link,_imageFile);
}

class _ChapterDetailState extends State<ChapterDetail> {
  String title='';
  String topic='';
  String link= '';
  File _imageFile;
  ProgressDialog pr;
  final databaseReference = Firestore.instance;
  var _chapterContentController= TextEditingController();
  bool _validate = false;
  var _questionController = TextEditingController();
  var _oneController = TextEditingController();
  var _twoController = TextEditingController();
  var _threeController = TextEditingController();
  var _fourController = TextEditingController();
  _ChapterDetailState(this.title,this.topic,this.link,this._imageFile);

  @override
  Widget build(BuildContext context) {

    pr = ProgressDialog(context);

    print('file path $_imageFile');
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
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,

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
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                        _chapterContentController.text.isEmpty ? _validate = true : _validate = false;
                        _oneController.text.isEmpty ? _validate = true : _validate = false;
                        _twoController.text.isEmpty ? _validate = true : _validate = false;
                        _threeController.text.isEmpty ? _validate = true : _validate = false;
                        _fourController.text.isEmpty ? _validate = true : _validate = false;
                      });
                      createTopic();

                    }
                ),
              )),
        ],
      ),
    );
  }

  void createTopic() async{
    DocumentReference mref;
    pr.style(
        message: 'Please Wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    await pr.show();
    StorageReference ref = FirebaseStorage
        .instance
        .ref()
        .child('${Timestamp.now()}.jpeg');
    StorageUploadTask task =
    ref.putFile(_imageFile);

    try{
      Random random = new Random();
      var uuid = Uuid().v4();
      var result = await task.onComplete;
      mref = await databaseReference.collection("Dynamic")

          .document(uuid.toString()).setData({
        'chaptertitle' : title,
        'topiccover': await result.ref.getDownloadURL(),
        'chaptercontent': _chapterContentController.text,

      }).then((myfun) async {
        await databaseReference.collection("Dynamic").document(uuid.toString()).collection(title)
            .add({
          'chaptertitle' : title,
          'topiccover': await result.ref.getDownloadURL(),
          'chaptercontent': _chapterContentController.text,
          'optionone': _oneController.text,
          'optiontwo': _twoController.text,
          'optionthree': _threeController.text,
          'optionfour': _fourController.text,
          'question': _questionController.text,
          'chaptercontent': _chapterContentController.text,
          'youtube': link,


        });
      });
      await _validate==false?
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
      Fluttertoast.showToast(
          msg: "News Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          fontSize: 16.0
      );
      pr.hide().then((isHidden) {
        print(isHidden);
      });
    }catch(e){
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey.shade300,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
  }
}
