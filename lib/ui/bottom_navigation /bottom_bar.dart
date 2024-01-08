import 'package:carnotautomart/ui/bottom_navigation%20/bottom_screen_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/helper/image_helper.dart';
import '../drawer/app_drawer.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
 final BottomScreenController _bottomScreenController = Get.put(BottomScreenController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int bodyIndex = 0;
  final _selectedItemColor = colorDeepOrange;
  final _unselectedItemColor = colorDeepGray;
  bool isFromDrawer = false;
  int titleIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading:  IconButton(
            icon: const Icon(
              Icons.menu,
              color:Colors.white,
              size: 35,
            ),
            splashRadius: 20,
            onPressed: () {
              if (!_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState?.openDrawer();
              } else {
                _scaffoldKey.currentState?.closeDrawer();
              }
            },
          ),
        title: Text(
          _bottomScreenController.appbarTitle[titleIndex].toUpperCase(),
          style: textTheme.bodyMedium,
        ),
      ),
      drawer: CustomDrawer(index: (index){
          _scaffoldKey.currentState?.closeDrawer();
      },),
      body:_bottomScreenController.screens[bodyIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorLightGray,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/ic_home.svg', 'Home', 0, textTheme),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                _buildIcon('assets/icons/ic_car.svg', 'Services', 1, textTheme),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                'assets/icons/ic_heart.svg', 'Favourite', 2, textTheme),
            label: '',
          ),
        ],
      ),
    );
  }

  Color _getItemColor(int index) =>
      bodyIndex == index ? _selectedItemColor : _unselectedItemColor;

  Widget _buildIcon(
          String iconData, String text, int index, TextTheme textTheme) =>
      SizedBox(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: InkWell(
          splashColor: colorLightOrange.withOpacity(.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                iconData,
                colorFilter:
                    ColorFilter.mode(_getItemColor(index), BlendMode.srcIn),
              ),
              Text(
                text,
                // style: TextStyle(fontSize: 12, color: _getItemColor(index))
                style:
                    textTheme.bodySmall?.copyWith(color: _getItemColor(index)),
              ),
            ],
          ),
          onTap: () => _onItemTapped(index),
        ),
      );

  void _onItemTapped(int index) {
    setState(() {
      isFromDrawer = false;
      bodyIndex = index;
      titleIndex = index;
    });
  }
}
