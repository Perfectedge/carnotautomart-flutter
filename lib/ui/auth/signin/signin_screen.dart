import 'dart:developer';

import 'package:carnotautomart/ui/auth/auth_controller.dart';
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
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      if (_authController.accountType.isEmpty) {
        _authController.getAccountType((isSuccess) {
          if (isSuccess) {
            Get.back();
          }
        });
      }
    });
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
              title: Text(
                'register'.toUpperCase(),
                style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white, decoration: TextDecoration.underline),
              ),
              flexibleSpace: appbarFlexibleSpace,
            ),
            body: Container(
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
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
                        suffixIconConstraints: const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: lastNameController,
                        lableText: 'Last Name',
                        suffixIcon: ImageHelper.icUserName,
                        suffixIconConstraints: const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: emailController,
                        lableText: 'Email',
                        suffixIcon: ImageHelper.icEmail,
                        suffixIconConstraints: const BoxConstraints(maxHeight: 15, maxWidth: 25),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: contactController,
                        lableText: 'contact number',
                        suffixIcon: ImageHelper.icPhone,
                        suffixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: passwordControlelr,
                        lableText: 'Password',
                        suffixIcon: ImageHelper.icLock,
                        suffixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      TextBoxWidget(
                        textTheme: textTheme,
                        controller: confirmPasswordControlelr,
                        lableText: 'confirm Password',
                        suffixIcon: ImageHelper.icLock,
                        suffixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
                      ),
                      SpaceHelper.verticalSpaceMedium,
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'account type'.toUpperCase(),
                            style: textTheme.labelSmall?.copyWith(color: Colors.white),
                          )),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: accountTypeController,
                          cursorColor: Colors.white,
                          style: textTheme.bodyMedium?.copyWith(letterSpacing: 0, fontWeight: FontWeight.normal),
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
                            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                          ),
                          readOnly: true,
                          onTap: () {
                            log(_authController.accountType.length.toString());
                            _showAccountTypeDialog(context, textTheme, (data) {
                              accountTypeController.text = data['name'];
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
                            backgroundColor: const Color.fromARGB(255, 0, 41, 74),
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

  Future<dynamic> _showAccountTypeDialog(BuildContext context, TextTheme textTheme, Function(dynamic data) onTapData) {
    return showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Account Type',
                      style: textTheme.labelMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (_authController.accountType.isNotEmpty)
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _authController.accountType.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              onTapData({'id': _authController.accountType[index].id, 'name': _authController.accountType[index].name});
                              Get.back();
                            },
                            padding: const EdgeInsets.only(left: 10),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            child: Row(
                              children: [
                                Text(
                                  _authController.accountType[index].name ?? '',
                                  textAlign: TextAlign.left,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                    ),
                ],
              ),
            ),
          );
        });
  }
}
