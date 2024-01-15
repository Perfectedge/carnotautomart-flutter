import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/helper/helper_functions.dart';

class CarnotMartAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CarnotMartAppbar({
    super.key,
  required this.title

  });
   final String title;



  @override
  Widget build(BuildContext context) {
      final TextTheme textTheme=Theme.of(context).textTheme;
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
          splashRadius: 20,
          splashColor: colorDeepOrange,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      title: Text(
       title.toUpperCase(),
        style: textTheme.labelMedium
            ?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
      flexibleSpace: appbarFlexibleSpace
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(kToolbarHeight);
}
