import 'package:flutter/material.dart';
import 'package:ossos_test/views/home/home.dart';
import '../constant/style_constant.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigateAfterSeconds(){
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context)=>const Home())
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigateAfterSeconds();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          logo,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}