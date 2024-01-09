
import 'package:flutter/material.dart';

import '../utils/helper/spacing_helper.dart';
import 'chat_controller.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.message
  });
  final MessageResponse message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message.currentDateTime??'',
            style: textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
          SpaceHelper.verticalSpace(2),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )),
            color: const Color(0xFFFFCD9C),
            child: Container(
              padding: const EdgeInsets.all(6),
              // decoration: BoxDecoration(color: colorLightOrange,),
              child: Text(
               message.message??'',
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  letterSpacing: .5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
