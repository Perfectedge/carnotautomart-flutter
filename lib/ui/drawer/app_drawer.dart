import 'dart:developer';

import 'package:carnotautomart/ui/auth/onbording_screen.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:carnotautomart/ui/utils/helper/image_helper.dart';
import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key, required this.trigger});
  ValueChanged trigger;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: colorLightOrange),
              child: ImageHelper.icLogo,
            ),
          ),
          SpaceHelper.verticalSpaceMedium,
          _drawerTileButton(
              textTheme: textTheme,
              imageName: AssetString.drawerHome,
              buttonName: 'Home',
              onPressed: () {
                widget.trigger('home');
              }),
          SpaceHelper.verticalSpaceSmall,
          _drawerTileButton(
              textTheme: textTheme,
              imageName: AssetString.account,
              buttonName: 'Account',
              onPressed: () {
                widget.trigger('home');
                Get.to(() => const OnBordingScreen(), transition: Transition.rightToLeft);
              }),
          SpaceHelper.verticalSpaceSmall,
          _drawerTileButton(
              textTheme: textTheme,
              imageName: AssetString.contact,
              buttonName: 'Contact Us',
              onPressed: () {
                widget.trigger('home');
              }),
          SpaceHelper.verticalSpaceSmall,
          _drawerTileButton(
              textTheme: textTheme,
              imageName: AssetString.rateUs,
              buttonName: 'Rate Us',
              onPressed: () {
                // widget.trigger('home');
              }),
          SpaceHelper.verticalSpaceSmall,
          _drawerTileButton(
              textTheme: textTheme,
              imageName: AssetString.share,
              buttonName: 'Share',
              onPressed: () {
                // widget.trigger('home');
              }),
        ],
      ),
    );
  }

  Padding _drawerTileButton(
      {required TextTheme textTheme, required String imageName, required String buttonName, required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CupertinoButton(
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageName,
              height: 20,
              width: 20,
            ),
            SpaceHelper.horizontalSpaceMedium,
            Text(
              buttonName,
              style: textTheme.bodyMedium?.copyWith(color: colorDarkAsh, fontWeight: FontWeight.normal, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
