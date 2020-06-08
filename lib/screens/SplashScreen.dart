import 'package:flutter/material.dart';
import 'package:quizappadmin/res.dart';
import 'dart:async';
import 'package:quizappadmin/screens/Homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin  {

  AnimationController rotationController;
  @override
  void initState() {
    rotationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    rotationController.forward(from: 0.0); // it starts the animation
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body:Center(child: Image.asset(Res.splash , fit: BoxFit.cover,))
    );
  }
}