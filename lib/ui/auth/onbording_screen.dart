import 'package:carnotautomart/ui/auth/login/login_screen.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/widget/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/carnotmart_appbabr.dart';

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
      decoration: const BoxDecoration(color: colorLightOrange),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          appBar:const CarnotMartAppbar(title:'Account' ,),
          body: Container(
            height: DeviceInfo(context).height,
            width: DeviceInfo(context).width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [colorLightOrange, colorDeepOrange])),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SpaceHelper.verticalSpaceMedium,
                  SizedBox(
                      width: 200,
                      child: Text(
                        'Your one place for all thing AUTO',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      )),
                  SpaceHelper.verticalSpaceMedium,
                  Container(
                      height: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset('assets/images/onboard_logo.png')),
                  SpaceHelper.verticalSpaceMedium,
                  SizedBox(
                      width: 250,
                      child: BaseButton(
                        onPress: () {},
                        title: 'Create an account'.toUpperCase(),
                        backgroundColor: Colors.white,
                        textStyle: textTheme.labelMedium?.copyWith(
                            color: colorDarkAsh, fontWeight: FontWeight.normal),
                      )),
                  SpaceHelper.verticalSpaceSmall,
                  SizedBox(
                      width: 250,
                      child: BaseButton(
                        onPress: () {
                          Get.to(() => LoginScreen(),
                              transition: Transition.rightToLeft);
                        },
                        title: 'Log in'.toUpperCase(),
                        backgroundColor: Colors.white,
                        textStyle: textTheme.labelMedium?.copyWith(
                            color: colorDarkAsh, fontWeight: FontWeight.normal),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

