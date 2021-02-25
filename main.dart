import 'package:edu_ocean/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 360,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],),
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
      title: "Edu Ocean",
      home: test_splash(),
    );
  }
}

class test_splash extends StatefulWidget {
  @override
  _test_splashState createState() => _test_splashState();
}

class _test_splashState extends State<test_splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              //width: 250.0,
              child: TextLiquidFill(
                waveDuration: Duration(milliseconds: 1600),
                loadDuration: Duration(milliseconds: 5600),
                text: 'Edu Ocean',
                waveColor: Colors.blue,
                boxBackgroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                //boxHeight: 300.0,
              ),
            ),
            Container(
              height: 0,
              child: SplashScreen(
                seconds: 6,
                navigateAfterSeconds: homepage(),
                //title: Text("Hi"),
                backgroundColor: Colors.white,
                useLoader: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}