import 'package:carnotautomart/ui/utils/helper/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAnimatedDialog(BuildContext context, Widget child) {
  return showGeneralDialog(
    // barrierLabel: "Contact Seller",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 350),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Scaffold(backgroundColor: Colors.transparent, resizeToAvoidBottomInset: true, body: child);
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}


 showAnimateDialogWithBox(BuildContext context,String name, Widget child) {
    final textTheme = Theme.of(context).textTheme;
    showAnimatedDialog(
        context,
        Center(
            child: Material(
          color: Colors.grey.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
                maxWidth: DeviceInfo(context).width - 40.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            name,
                            style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
                          )),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.cancel),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child,
                ],
              ),
            ),
          ),
        )));
  }