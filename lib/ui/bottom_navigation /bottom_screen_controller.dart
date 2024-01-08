import 'package:carnotautomart/ui/bottom_navigation%20/home/home_screen.dart';
import 'package:carnotautomart/ui/bottom_navigation%20/service/service_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'favourite/favourite_screen.dart';

class BottomScreenController extends GetxController {
  List<String> appbarTitle = ['Home', 'Services', 'Favourite'];
  List<Widget> screens = [HomeScreen(),ServiceScreen(),FavouriteScreen()];
}
