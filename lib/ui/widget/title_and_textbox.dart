import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/app_colors.dart';
import '../utils/helper/device_info.dart';
import '../utils/helper/spacing_helper.dart';

class TextBoxtWithTitle extends StatelessWidget {
  const TextBoxtWithTitle({super.key,  this.headerTitle, required this.title, required this.width, required this.keyboardType});
  final String? headerTitle;
  final String title;
  final double width;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: headerTitle?.isNotEmpty==true,
          child: Text(
            headerTitle?? '',
            style: textTheme.bodySmall?.copyWith(color: Colors.black, letterSpacing: .3, fontWeight: FontWeight.normal),
          ),
        ),
        Visibility(
          visible: headerTitle?.isNotEmpty==true,
          child: SpaceHelper.verticalSpaceSmall),
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.white,
          elevation: 0,
          child: Container(
            width: width,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextFormField(
                // controller: _chatController.messageController,
                autofocus: false,
                // maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  //  border:_border ,
                  // enabledBorder: _border,
                  //  focusedBorder: _border,
                  hintText: title,
                  hintStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: colorDarkAsh),
                ),
                keyboardType: keyboardType,
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                onChanged: (text) {},
                onTapOutside: (value) {
                  // log('onTapOutside called');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
