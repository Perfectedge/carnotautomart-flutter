import 'dart:developer';
import 'dart:io';
import 'package:carnotautomart/data/local/pref_keys.dart';
import 'package:carnotautomart/ui/auth/signin/signin_screen.dart';
import 'package:carnotautomart/ui/utils/helper/helper_functions.dart';
import 'package:carnotautomart/ui/utils/helper/image_helper.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';

import 'package:carnotautomart/ui/widget/base_button.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/app_colors.dart';
import '../../widget/text_box_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControlelr = TextEditingController();
  TextEditingController passwordControlelr = TextEditingController();
  FocusNode _focusNode = FocusNode();
  final _storage = GetStorage();
  double iOSVersion = 0.0;
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      String cleanNumber = '${_storage.read(PrefKeys.iosVersion)}'
          .replaceAll(RegExp(r'\.\d+$'), '');
      iOSVersion = double.parse(cleanNumber);
    }
    log(iOSVersion.toString());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        hideKyBoard(context);
      },
      child: Container(
        decoration: const BoxDecoration(color: colorLightOrange),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Expanded(
                      child: Text(
                    'login'.toUpperCase(),
                    style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'done'.toUpperCase(),
                      style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ],
              ),
              flexibleSpace: appbarFlexibleSpace,
            ),
            body: Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover)),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SpaceHelper.verticalSpaceMedium,
                      ImageHelper.icLogo,
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: emailControlelr,
                        lableText: 'Email',
                        suffixIcon: ImageHelper.icEmail,
                      ),

                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: passwordControlelr,
                        lableText: 'Password',
                        suffixIcon: ImageHelper.icLock,
                      ),
                      SpaceHelper.verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Forgot Password',
                                style: textTheme.bodySmall,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ),
                        ],
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      SizedBox(
                          width: 100,
                          child: BaseButton(
                            onPress: () {},
                            title: 'Login'.toUpperCase(),
                            backgroundColor:
                                const Color.fromARGB(255, 0, 41, 74),
                            textStyle: textTheme.labelMedium,
                            isBorder: true,
                          )),
                      SpaceHelper.verticalSpaceSmall,
                      Text(
                        'Login with'.toUpperCase(),
                        style: textTheme.bodySmall
                            ?.copyWith(fontStyle: FontStyle.italic),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialLoginButton(
                              backgroundColor: Colors.red,
                              child: SvgPicture.asset(
                                'assets/icons/ic_google.svg',
                                height: 25,
                                width: 25,
                              ),
                              onPressed: () {}),
                          SpaceHelper.horizontalSpaceSmall,
                          if (Platform.isIOS && iOSVersion > 13.0)
                            SocialLoginButton(
                              backgroundColor: Colors.transparent,
                              child: SvgPicture.asset(
                                  'assets/icons/ic_apple.svg',
                                  height: 25,
                                  width: 25),
                              onPressed: () {},
                            ),
                          SpaceHelper.horizontalSpaceSmall,
                          SocialLoginButton(
                            backgroundColor: const Color(0xff0866FF),
                            child: SvgPicture.asset(
                                'assets/icons/ic_facebook.svg',
                                height: 25,
                                width: 25),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      RichText(
                        text: TextSpan(
                            text: 'Register now'.toUpperCase(),
                            style: textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => SignInScreen(),
                                    transition: Transition.rightToLeft);
                              }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.backgroundColor,
    required this.child,
    required this.onPressed,
  });
  final Color backgroundColor;
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.all(8),
            shape: const CircleBorder(),
            backgroundColor: backgroundColor,
            side: const BorderSide(color: Colors.white, width: 2.0),
            elevation: 2),
        child: child);
  }
}
