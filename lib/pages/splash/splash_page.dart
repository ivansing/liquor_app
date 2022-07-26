import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;
  
  @override
  void initState(){
    super.initState();
    controller = new AnimationController(
        vsync: this, 
        duration: Duration(seconds: 2))..forward();

    animation = new CurvedAnimation(parent: controller, 
        curve: Curves.linear);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/image/logo.png", width: 150,)))
        ],
      ),
    );
  }
}
