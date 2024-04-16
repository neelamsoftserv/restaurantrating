import 'package:flutter/material.dart';
import 'package:restaurantrating/constants/image_constants.dart';
import 'package:restaurantrating/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)
          => const HomePage()
      ), (route) => false);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
              child: Image.asset(ImageConstants.splashImage,fit: BoxFit.fitWidth,)),
        )
    );
  }
}
