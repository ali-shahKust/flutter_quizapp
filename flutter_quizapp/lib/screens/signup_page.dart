import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterquizapp/app_color/app_color.dart';
import 'package:progress_dialog/progress_dialog.dart';


import '../res.dart';
import 'home_page.dart';
import 'loginpage.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  String _email, _password,_name;
  final databaseReference = Firestore.instance;
  ProgressDialog pr;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _liccontroller = TextEditingController();

  //Basic Structure Of Program
  @override
  Widget build(BuildContext context) {

    pr = new ProgressDialog(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff625CFE),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'QuizApp',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ), SizedBox(height: 15,),
          Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ),
          ),
          SizedBox(height: 25,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: _namecontroller,
                onChanged: (String value) {},
                cursorColor: Constant.appColor,
                decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: Constant.appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(

                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                onChanged: (String value) {},
                cursorColor: Constant.appColor,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Constant.appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                obscureText: true,
                controller: _passwordcontroller,
                onChanged: (String value) {},
                cursorColor: Constant.appColor,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Constant.appColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Constant.btnBackground),
                child: FlatButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      signUp();
                    });
                  },
                ),
              )),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "I have an Account ? ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              GestureDetector(
                child: Text("Click here ",
                    style: TextStyle(
                        color: Constant.appColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline)),
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login_page()));
                  });
                },
              ),
            ],
          ),
          Container(
            child: Image.asset(Res.bottom),
          ),
        ],
      ),
    );
  }
  //Function will called On sign up Button
  void signUp() async {
//getting Text From TextField
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;
    _name = _namecontroller.text;

    try{

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

      //Create user And check Validations
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

      String mUid = (await FirebaseAuth.instance.currentUser()).uid;
      //Firestore
      await databaseReference.collection("users")
          .document(mUid).setData({
        'username': _namecontroller.text,
        'email': _email,
        'password': _password,
        'user_uid': mUid,
      });
      pr.hide().then((isHidden) {
        print(isHidden);
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch(e){

      pr.hide().then((isHidden) {
        print(isHidden);
      });
      print(e.message);
    }

  }
}
