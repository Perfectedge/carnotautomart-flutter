import 'dart:io';

import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration:const BoxDecoration(color: colorLightOrange),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              splashRadius: 20,
              splashColor: colorDeepOrange,
                onPressed: () {
                  Get.back();
                },
                icon:const Icon(Icons.arrow_back_ios_new_rounded)),
            title: Text(
              'Account'.toUpperCase(),
              style: textTheme.labelMedium
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            flexibleSpace:  Image(
              height: Platform.isIOS?76: 80,
              width: double.infinity,
              image: AssetImage(
                  'assets/images/bg_appbar.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          body: Container(
            height: DeviceInfo(context).height,
            width: DeviceInfo(context).width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    colorLightOrange,
                    colorDeepOrange
              ])
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                SpaceHelper.verticalSpaceMedium,
                SizedBox(
                  width: 200,
                  child: Text('Your one place for all thing AUTO',textAlign: TextAlign.center,style: textTheme.bodyLarge,)),
                    SpaceHelper.verticalSpaceMedium,
                    Container(
                      height: 350,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                      child: Image.asset('assets/images/onboard_logo.png')),
      
                      SpaceHelper.verticalSpaceMedium,
                      SizedBox(
                        width: 250,
                        child: BaseButton(onPress: (){}, title: 'Create an account'.toUpperCase(),backgroundColor: Colors.white,textStyle:textTheme.labelMedium?.copyWith(color:colorDarkAsh,fontWeight: FontWeight.normal),)),
                         SpaceHelper.verticalSpaceSmall,
                      SizedBox(
                        width: 250,
                        child: BaseButton(onPress: (){}, title: 'Log in'.toUpperCase(),backgroundColor: Colors.white,textStyle:textTheme.labelMedium?.copyWith(color:colorDarkAsh,fontWeight: FontWeight.normal),))
      
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
