import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/text_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/bottom_navigation /bottom_bar.dart';
import 'ui/splash/splash_screen.dart';
import 'ui/widget/all_chomphonent.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Carnotautomart',
      locale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: scaffoldBAckground,
        textTheme: AppTextTheme().lightTextTheme,
        fontFamily: 'Averta Standard'
      ),
      home:SliderDrawerAndBottomNavigation() //BottomBarScreen() //AllChomphonent() //SplashScreen() ,


    );
  }
}
