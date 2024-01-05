import 'package:carnotautomart/data/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/chat/chat_screen.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AllChomphonent extends StatefulWidget {
  const AllChomphonent({super.key});

  @override
  State<AllChomphonent> createState() => _AllChomphonentState();
}

class _AllChomphonentState extends State<AllChomphonent> {
  late FToast fToast;

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
              borderRadius: BorderRadius.circular(100), color: colorDeeprOrange),
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
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return child;
        });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorLightOrange,
      appBar: AppBar(
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
          ],
        ),
      ),
    );
  }
}
