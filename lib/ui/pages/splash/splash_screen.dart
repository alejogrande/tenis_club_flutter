
import 'package:flutter/material.dart';
import 'package:tenis_club/utils/constans.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override

  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: Const.splashDuration),
       () => Navigator.pushReplacementNamed(context, Routes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          Assets.splashImage,
          fit: BoxFit.fill,
          
        ),
      ),
    );
  }
}
