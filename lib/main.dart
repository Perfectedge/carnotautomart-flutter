import 'dart:io';

import 'package:carnotautomart/ui/auth/auth_controller.dart';
import 'package:carnotautomart/ui/filter/filter_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/text_font_style.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/local/pref_keys.dart';
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
  @override
  void initState() {
    super.initState();
    initializeController();
    findDeviceInfo();
  }

  findDeviceInfo() async {
    final storage = GetStorage();
    var deviceinfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceinfo.androidInfo;
      // log("Android info :${androidInfo.id} ");
      storage.writeIfNull(PrefKeys.deviceToken, androidInfo.id);
    } else if (Platform.isIOS) {
      var iosInfo = await deviceinfo.iosInfo;
      // log("iOS info :${iosInfo.identifierForVendor} ");
      // log("iOS version :${iosInfo.systemVersion} ");
      storage.writeIfNull(PrefKeys.deviceToken, iosInfo.identifierForVendor);
      storage.writeIfNull(PrefKeys.iosVersion, iosInfo.systemVersion);
    }
  }

  initializeController() {
    Get.put(AuthController());
    Get.put(FilterController());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Carnotautomart',
        locale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: scaffoldBAckground,
          textTheme: AppTextTheme().lightTextTheme,
          fontFamily: 'Roboto',
        ),
        home:
            SliderDrawerAndBottomNavigation() //BottomBarScreen() //AllChomphonent() //SplashScreen() ,

        );
  }
}
