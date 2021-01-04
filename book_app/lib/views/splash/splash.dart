// Splash Screen
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:book_app/util/router.dart';
import 'package:book_app/views/main_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTimeout() {
    return new Timer(Duration(seconds: 16), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    MyRouter.pushPageReplacement(
      context,
      MainScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/A2.jpg",),
                fit: BoxFit.fill,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              ),
            ),
          ),

          // Open Library Logo
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/iconik2.png',
                width: 300,
                height: 300,
              ),
            ],
          ),

          // FeedBooks
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Logo
              Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new Image.asset(
                    'assets/images/icon.png',
                    height: 100.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
