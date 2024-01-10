import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:carnotautomart/ui/utils/helper/helper_functions.dart';
import 'package:carnotautomart/ui/utils/helper/image_helper.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControlelr=TextEditingController();
  TextEditingController passwordControlelr=TextEditingController();
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
            resizeToAvoidBottomInset: false,
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
              height: DeviceInfo(context).height,
              width: DeviceInfo(context).width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.fill)),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpaceHelper.verticalSpaceMedium,
                    TextBoxWidget(
                    textTheme: textTheme,
                    controller: emailControlelr,
                    lableText: 'Email',
                    suffixIcon: ImageHelper.icEmail,
                    ),
                     
                     SpaceHelper.verticalSpaceMedium,
                    //       TextBoxWidget(
                    // textTheme: textTheme,
                    // controller: passwordControlelr,
                    // lableText: 'Password',
                    // suffixIcon: ImageHelper.icLock,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextBoxWidget extends StatefulWidget {
   TextBoxWidget({
    super.key,
    required this.textTheme,
    required this.controller,
    required this.lableText,
    this.suffixIcon,
    this.validator,
    this.isObsecure

  });

  final TextTheme textTheme;
  final String lableText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  String? Function(String?)? validator;
   bool? isObsecure;

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
    
      cursorColor: Colors.white,
      scrollPadding: EdgeInsets.zero,
      obscureText: widget.isObsecure ?? false,
      style: widget.textTheme.bodyMedium
          ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.normal),
          
      decoration: InputDecoration(
          contentPadding:EdgeInsets.all(0), // Adjust padding as needed
          
          labelText: widget.lableText.toUpperCase(),
          labelStyle: widget.textTheme.bodyMedium
              ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.normal,fontSize:14),
                //  helperText: ' ',
          // hintText: _isFocused ? '' : widget.lableText.toUpperCase(),   
          //  hintStyle:widget.textTheme.bodySmall?.copyWith(color: Colors.white),
          
      
          enabledBorder:_border ,
          focusedBorder: _border,
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: BoxConstraints(maxHeight: 20,maxWidth: 20)
          ),
          validator: widget.validator,
        
    );
  }

  final _border=const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white));
}
