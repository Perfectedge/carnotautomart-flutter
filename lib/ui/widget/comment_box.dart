import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
 const CommentBox({super.key, this.width, required this.title});

final  double? width;
 final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      elevation: 0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: width ?? double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: TextFormField(
                  autofocus: false,
                  maxLines: 30,
                  minLines: 1,
                  decoration: InputDecoration(
                    isDense: false,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: title,
                    hintStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: colorDarkAsh),
                  ),
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  onChanged: (text) {},
                  onTapOutside: (value) {
                    // log('onTapOutside called');
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(CupertinoIcons.arrow_up_right_circle),
          )
        ],
      ),
    );
  }
}
