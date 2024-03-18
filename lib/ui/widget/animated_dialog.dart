import 'package:flutter/material.dart';

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
