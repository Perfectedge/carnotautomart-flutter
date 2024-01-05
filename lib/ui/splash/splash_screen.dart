import 'package:carnotautomart/data/helper/device_info.dart';
import 'package:carnotautomart/data/helper/image_helper.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: DeviceInfo(context).height,
        width: DeviceInfo(context).width,
        decoration:const BoxDecoration(
          color: Colors.green,
          gradient: LinearGradient(
          colors: [
            colorLightOrange,
            colorDeeprOrange
          ],
          begin:Alignment.topCenter ,
          end:Alignment.bottomCenter ,
          // stops: [
          //   0.5,
          //   0.6
          // ],
          
          
          )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: ImageHelper.icLogo),
            ],
          ),
      ),
    );
  }
}
