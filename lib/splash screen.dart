import 'dart:async';
import 'package:cafe/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    wait();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold( appBar: AppBar(title: Text("Cafe",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800),),backgroundColor: Colors.black,),
      body: Center(
        child: Lottie.asset('assets/anim.json'),
      ),backgroundColor: Colors.black,
    ) ;
  }

  wait()async
  {
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage())));
  }
}
