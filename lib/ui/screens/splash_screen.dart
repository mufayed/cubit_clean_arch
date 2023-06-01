import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_name/ui/constants/sizer/extension.dart';
import '../constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              Images.logo,
              height: 20.h,
            ),
          ),
          Center(
            child: Text(
              "gives you opportunities".toUpperCase(),
              style: TextStyle(fontSize: 23.px, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "to win amazing prizes!".toUpperCase(),
              style: TextStyle(fontSize: 15.px, fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    );
  }
}
