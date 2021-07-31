import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text("IRCTSEE",style: TextStyle(color: Colors.white,fontSize: 30),),),
      backgroundColor: new Color(0xFF0e1a73),
    );
  }
}
