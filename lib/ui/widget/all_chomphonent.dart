import 'dart:developer';

import 'package:carnotautomart/ui/utils/helper/helper_functions.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/data/remote/model/state_response.dart';
import 'package:carnotautomart/ui/chat/chat_screen.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/text_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'state_and_city_search_widget.dart';

class AllChomphonent extends StatefulWidget {
  const AllChomphonent({super.key});

  @override
  State<AllChomphonent> createState() => _AllChomphonentState();
}

class _AllChomphonentState extends State<AllChomphonent> {
  late FToast fToast;
  String selectName = 'Select State';

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(Get.context!);
  }

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 20,
          width: 20,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: colorDeepOrange),
          child: Image.asset('assets/images/ic_flame.png'),
        ),
        SpaceHelper.horizontalSpaceSmall,
        Text(
          "This is a Custom Toast",
          style: TextFontStyle.bodySmall.copyWith(color: Colors.black),
        ),
      ],
    ),
  );
  _showBuilderToast() {
    fToast.showToast(
        child: toast,
        isDismissable: true,
        gravity: ToastGravity.SNACKBAR,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return child;
        });
  }

  _showBottomSheet() {
    showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return BottomSheetWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: scaffoldBAckground,
      appBar: AppBar(
        elevation: 0,
        title: const Text('All comphonent'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => ChatScreen());
              },
              icon: Icon(Icons.chat))
        ],
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: MyAppBarClipper(),
              child: Container(
                height: 60,
                decoration: BoxDecoration(color: colorDeepOrange),
              ),
            ),
            ElevatedButton(
              child: const Text('Flutter Toast'),
              onPressed: () {
                _showBuilderToast();
              },
            ),
            SpaceHelper.verticalSpaceMedium,
            TextFormField(
              cursorColor: Colors.white,
              style: textTheme.bodyMedium?.copyWith(letterSpacing: 2),
              decoration: InputDecoration(
                  hintText: 'First Name'.toUpperCase(),
                  hintStyle: textTheme.bodyMedium?.copyWith(
                      letterSpacing: 1, fontWeight: FontWeight.normal),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: Icon(Icons.invert_colors_on_rounded)),
            ),
            SpaceHelper.verticalSpaceMedium,
            ElevatedButton(
                onPressed: () {
                  _showBottomSheet();
                },
                child: Text('bottom sheet')),

            SpaceHelper.verticalSpaceMedium,

            /// Dropdown Button
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                highlightElevation: .5,
                elevation: .5,
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return StateAndCitySearchWidget(
                          notifier: (text) {
                            log('Selected result: $text');
                            setState(() {
                              selectName = text;
                            });
                          },
                        );
                      });
                },
                child: Row(children: [
                  Text(
                    selectName,
                    style: textTheme.bodySmall?.copyWith(color: colorDarkAsh),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorDarkAsh,
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              splashRadius: 20,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Text('Bottom sheet')),
    );
  }
}

class MyAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30;
    log('Size is:${size.height}');
    Path path = Path()
      ..lineTo(0, 0) //start point

      ..lineTo(size.width, 0) // device width(dx),0(dy)
      ..lineTo(size.width, size.height - radius) //deviceWidth, 100
      ..arcToPoint(
          Offset(size.width - radius,
              size.height - (radius * 2)), //deviceWidth-20,160
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo(radius, size.height - (radius * 2)) //20,100
      ..arcToPoint(Offset(0, size.height - radius), //0,100
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo(0, size.height - radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
