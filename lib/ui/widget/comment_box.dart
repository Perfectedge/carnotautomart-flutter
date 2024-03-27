import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommentBox extends StatelessWidget {
   CommentBox({super.key,this.width,required this.title});

  double? width;
  String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 40.0,
      child: Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                color: Colors.white,
                elevation: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                            width: width ??double.infinity,
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
                                
                                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                                onChanged: (text) {},
                                onTapOutside: (value) {
                                  // log('onTapOutside called');
                                },
                              ),
                            ),
                      ),
                    ),
                    Icon(CupertinoIcons.arrow_up_right_circle)
                  ],
                ),
      ),
    );
  }
}