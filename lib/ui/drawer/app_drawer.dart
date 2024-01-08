import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
   CustomDrawer({super.key,required this.index});
  ValueChanged index;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
    );
  }
}