import 'dart:io';
import 'dart:ui' as ui;
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../drawer/app_drawer.dart';
import '../utils/helper/helper_functions.dart';
import '../utils/helper/image_helper.dart';
import 'favourite/favourite_screen.dart';
import 'home/home_screen.dart';
import 'service/service_screen.dart';
import 'slider_drawer/helper/slider_shadow.dart';
import 'slider_drawer/slider.dart';

class SliderDrawerAndBottomNavigation extends StatefulWidget {
  const SliderDrawerAndBottomNavigation({super.key});

  @override
  State<SliderDrawerAndBottomNavigation> createState() => _SliderDrawerAndBottomNavigationState();
}

class _SliderDrawerAndBottomNavigationState extends State<SliderDrawerAndBottomNavigation> with TickerProviderStateMixin {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();
  String barTitle = 'Home'.toUpperCase();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: colorLightOrange, statusBarBrightness: Brightness.dark),
      child: Container(
        color: colorLightOrange,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Scaffold(
            body: SliderDrawer(
                key: _sliderDrawerKey,
                animationController: animationController,
                sliderBoxShadow: SliderBoxShadow(color: Colors.black12),
                appBar: AppBar(
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    leading: IconButton(
                      icon: AnimatedIcon(
                        progress: CurvedAnimation(parent: animationController, curve: Curves.linear),
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                      splashRadius: 20,
                      onPressed: () {
                        _sliderDrawerKey.currentState?.toggle();
                      },
                    ),
                    title: Text(
                      barTitle,
                      style: textTheme.bodyMedium?.copyWith(letterSpacing: 0),
                    ),
                    flexibleSpace: Image(
                      height: Platform.isIOS ? 60 : 60, //
                      // height: 115,
                      width: double.infinity,
                      image: const AssetImage('assets/images/bg_appbar.png'), // Replace with your image path
                      fit: BoxFit.cover,
                    )),
                slider: CustomDrawer(
                  trigger: (value) {
                    _onTriggerCustomDrawerButton(value);
                  },
                ),
                child: BottomBarScreen(appBarTitle: (title) {
                  setState(() {
                    barTitle = title.toString().toUpperCase();
                  });
                })),
          ),
        ),
      ),
    );
  }

  _onTriggerCustomDrawerButton(dynamic triggerValue) {
    if (triggerValue == 'home') {
      _sliderDrawerKey.currentState?.toggle();
    }
  }
}

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({super.key, required this.appBarTitle});
  ValueChanged<String> appBarTitle;
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // final BottomScreenController _bottomScreenController =
  //     Get.put(BottomScreenController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int bodyIndex = 0;
  final _selectedItemColor = colorDeepOrange;
  final _unselectedItemColor = colorDeepGray;
  bool isFromDrawer = false;
  List<String> appbarTitle = ['Home', 'Services', 'Favourite'];
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        index: (index) {
          _onItemTapped(index);
        },
      ),
      const ServiceScreen(),
      const FavouriteScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      key: _scaffoldKey,
      body: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: screens[bodyIndex],
        // key: ValueKey(bodyIndex),
        switchInCurve: Curves.linear,
        switchOutCurve: Curves.linear,
        transitionBuilder: (child, animation) {
          // return ScaleTransition(
          //   scale: animation,
          //   child: child,
          // );
          return FadeTransition(
            opacity: animation,
            child: child,
          );
          // final curvedAnimation = CurvedAnimation(
          //   parent: animation,
          //   curve: Curves
          //       .easeInOut, // Specify the overall curve for the transition
          // );
          // return SlideTransition(
          //   position: Tween<Offset>(
          //     begin: Offset(1.0, 0.0),
          //     end: Offset(0.0, 0.0),
          //   ).animate(curvedAnimation),
          //   child: child,
          // );
        },
      ),
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
            icon: _buildIcon('assets/icons/ic_car.svg', 'Services', 1, textTheme),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/icons/ic_heart.svg', 'Favourite', 2, textTheme),
            label: '',
          ),
        ],
      ),
    );
  }

  Color _getItemColor(int index) => bodyIndex == index ? _selectedItemColor : _unselectedItemColor;

  Widget _buildIcon(String iconData, String text, int index, TextTheme textTheme) => SizedBox(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: InkWell(
          splashColor: colorLightOrange.withOpacity(.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                iconData,
                colorFilter: ColorFilter.mode(_getItemColor(index), BlendMode.srcIn),
              ),
              Text(
                text,
                // style: TextStyle(fontSize: 12, color: _getItemColor(index))
                style: textTheme.bodySmall?.copyWith(color: _getItemColor(index)),
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
      widget.appBarTitle(appbarTitle[index]);
    });
  }
}
