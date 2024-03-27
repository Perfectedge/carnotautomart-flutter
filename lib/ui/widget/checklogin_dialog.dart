import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckLoginDialog extends StatelessWidget {
  const CheckLoginDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(
        "Kindly Login or Sign up to continue",
      ),
      actions: [
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel")),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {

              // Get.offAll(() => const HomeScreen(), transition: Transition.cupertino);
            },
            child: const Text("Ok")),
      ],
    );
  }
}
