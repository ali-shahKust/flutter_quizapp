import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:quizappadmin/screens/chapter_details.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
class _HomepageState extends State<Homepage> {
  var _newstitleController= TextEditingController();

  var _newDescController= TextEditingController();

  var _topictitleController= TextEditingController();

  var _youTubeLinkController= TextEditingController();

  var _chapterTitleController = TextEditingController();
  bool _validate = true ;
  DocumentSnapshot mRef;
  final databaseReference = Firestore.instance;
   ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);

    return DefaultTabController(
     length: 2,
     child: Scaffold(
       key: _key,
      body: ListView(
         children: <Widget>[
           Container(
             height: 700,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[

                 topTabBar(),
                 Expanded(
                   child: TabBarView(
                     children: [
                       AddNews(),
                       DynamicTopics()
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ));
  }

  Widget topTabBar() {
    return Container(
      height: 45,
      color: Color(0xff6964FF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width / 35,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
            TabBar(
              indicatorColor: Color(0xff6964FF),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              tabs: [
                Tab(
                  text: "Add News",
                ),
                Tab(
                  text: "Dynamic Topics",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget AddNews(){
    return Container(
    child:    ListView(
      children: <Widget>[
        SizedBox(height: 30,),
        CircleAvatar(
          radius: 40,
          child: GestureDetector(
            onTap: () {
              _openChooser();
            },
            child: _imageFile == null
                ? Icon(
              Icons.file_upload,
              size: 45,
            )
                : CircleAvatar(
              backgroundImage: FileImage(_imageFile),
              radius: 32,
            ),
          ),
        ),

        Center(child: Text('Upload News Header')),
        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: TextField(
              controller: _newstitleController,
              onChanged: (String value) {},
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  hintText: "News Title",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 25, vertical: 13)),
            ),
          ),
        ),

        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: TextField(
              maxLines: 7,
              controller: _newDescController,
              onChanged: (String value) {},
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,

                  hintText: "Description",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 25, vertical: 13)),
            ),
          ),
        ),
        SizedBox(height: 30.0),

        Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xff6964FF)),
              child: FlatButton(
                child: Text(
                  "Upload News".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                onPressed: () {
                  setState(() {
                    _newstitleController.text.isEmpty ? _validate = true : _validate = false;
                    _newDescController.text.isEmpty ? _validate = true : _validate = false;
                  });
                  createNews();
                  }
              ),
            )),
      ],

    ),
    );
  }

  Widget DynamicTopics(){
    return Container(
      child:    ListView(
        children: <Widget>[

          SizedBox(height: 30,),
          CircleAvatar(
            radius: 40,
            child: GestureDetector(
              onTap: () {
                _openChooser();
              },
              child: _imageFile == null
                  ? Icon(
                Icons.add_a_photo,
                size: 45,
              )
                  : CircleAvatar(
                backgroundImage: FileImage(_imageFile),
                radius: 32,
              ),
            ),
          ),

          Center(child: Text('Upload Topic Cover')),
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _topictitleController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    hintText: "Title of topic",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _youTubeLinkController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,

                    hintText: "Youtube link Explain Video",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),
SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(height: 15,color: Colors.black87,thickness: 0.5,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Text('Chapter Title',style: TextStyle(color: Colors.blueGrey),),
          ),
    SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _chapterTitleController,
                onChanged: (String value) {},
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    hintText: "Chapter Title",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: 13)),
              ),
            ),
          ),

          SizedBox(height: 30,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xff6964FF)),
                child: FlatButton(
                    child: Text(
                      "Next".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {

                      setState(() {
                        _youTubeLinkController.text.isEmpty ? _validate = true : _validate = false;
                        _topictitleController.text.isEmpty ? _validate = true : _validate = false;
                        _chapterTitleController.text.isEmpty ? _validate = true : _validate = false;
                      });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChapterDetail(
                          _chapterTitleController.text,
                          _topictitleController.text,
                          _youTubeLinkController.text,
                          _imageFile,
                        )));
                    }
                ),
              )),
        ],

      ),
    );
  }
  File _imageFile;
  PickedFile _pickedFile;

  //Open gallery/camera
  pickImage(ImageSource source) async {
    _pickedFile = await ImagePicker().getImage(source: source);
    if (_pickedFile != null) {
      _imageFile = File(_pickedFile.path);
    }
    setState(() {});
  }
  void _openChooser() {
    _key.currentState.showBottomSheet((context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 100,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 55,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.image,
                    size: 52,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
  //Function will be called On Request Send
  void createNews() async{
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

      var result = await task.onComplete;
      DocumentReference ref = await databaseReference.collection("News")
          .add({
        'newstitle' : _newstitleController.text,
        'newsdescription': _newDescController.text,
        'newsheader': await result.ref.getDownloadURL(),
      });
     await setState(() {
        _newstitleController.text ='';
        _newDescController.text = '';
        _imageFile = null;
      });

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
