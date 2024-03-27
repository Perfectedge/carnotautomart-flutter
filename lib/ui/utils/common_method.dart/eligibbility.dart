 import 'package:carnotautomart/ui/post%20details/eligilility_screen.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget eligibbility(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Get.to(() => EligibilityScreen(), transition: Transition.downToUp, duration: Duration(milliseconds: 400));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        decoration: BoxDecoration(
            color: colorLightOrange.withOpacity(.1), borderRadius: BorderRadius.circular(25), border: Border.all(color: colorLightOrange)),
        child: Text('Check Eligibility', style: textTheme.bodySmall?.copyWith(color: colorDeepOrange, fontSize: 10)),
      ),
    );
  }