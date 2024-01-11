import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/helper/helper_functions.dart';
import '../../utils/helper/image_helper.dart';
import '../../utils/helper/spacing_helper.dart';
import '../../widget/base_button.dart';
import '../../widget/text_box_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordControlelr = TextEditingController();
  TextEditingController confirmPasswordControlelr = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
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
              title: Text(
                'register'.toUpperCase(),
                style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    decoration: TextDecoration.underline),
              ),
              flexibleSpace: appbarFlexibleSpace,
            ),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover)),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ImageHelper.icLogo,
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: firstNameController,
                        lableText: 'First Name',
                        suffixIcon: ImageHelper.icUserName,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: lastNameController,
                        lableText: 'Last Name',
                        suffixIcon: ImageHelper.icUserName,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: emailController,
                        lableText: 'Email',
                        suffixIcon: ImageHelper.icEmail,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 15, maxWidth: 25),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: contactController,
                        lableText: 'contact number',
                        suffixIcon: ImageHelper.icPhone,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 20, maxWidth: 20),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: passwordControlelr,
                        lableText: 'Password',
                        suffixIcon: ImageHelper.icLock,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 20, maxWidth: 20),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: confirmPasswordControlelr,
                        lableText: 'confirm Password',
                        suffixIcon: ImageHelper.icLock,
                        suffixIconConstraints:
                            const BoxConstraints(maxHeight: 20, maxWidth: 20),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'account type'.toUpperCase(),
                            style: textTheme.labelSmall
                                ?.copyWith(color: Colors.white),
                          )),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: textTheme.bodyMedium?.copyWith(
                              letterSpacing: 0, fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            hintText: 'Select Type',
                            hintStyle: textTheme.bodyMedium?.copyWith(
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          readOnly: true,
                          onTap: () {
                            showCupertinoDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Dialog(
                                    child: SizedBox(
                                      height: 400,
                                      child: Column(
                                        children: [Text('asdasdasd')],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      SizedBox(
                          width: 100,
                          child: BaseButton(
                            onPress: () {},
                            title: 'signup'.toUpperCase(),
                            backgroundColor:
                                const Color.fromARGB(255, 0, 41, 74),
                            textStyle: textTheme.labelMedium,
                            isBorder: true,
                          )),
                      SpaceHelper.verticalSpaceMedium,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Have a account ',
                          style: textTheme.bodySmall,
                        ),
                        TextSpan(
                            text: 'Back to Login',
                            style: textTheme.bodySmall,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back();
                              }),
                      ])),
                      SpaceHelper.verticalSpaceMedium,
                      SpaceHelper.verticalSpaceMedium,
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
