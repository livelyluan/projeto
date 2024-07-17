import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(const Duration(milliseconds: 3600), () {
      FlutterSplashScreen.hide();
      Navigator.pushNamed(context, 'home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B7C82),
      body: Center(
        child: Row(
          children: [
            Image.asset(
              'assets/images/bookfinder',
              width: 100,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
