import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> launchWebUrl(String url) async {
  await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault)
      : Fluttertoast.showToast(msg: "Something went wrong!");
}
