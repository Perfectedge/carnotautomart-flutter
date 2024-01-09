import 'dart:developer';

import 'package:carnotautomart/ui/utils/helper/spacing_helper.dart';
import 'package:carnotautomart/ui/chat/chat_controller.dart';
import 'package:carnotautomart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../utils/helper/helper_functions.dart';
import 'chat_message_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatController _chatController;
  @override
  void initState() {
    super.initState();
    _chatController = Get.put(ChatController());


  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        hideKyBoard(context);
      },
      child: Scaffold(
        backgroundColor: scaffoldBAckground,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: const Text('ChatScreen')),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            SpaceHelper.verticalSpaceMedium,
            Expanded(
              child: Obx(() {
                //to scroll  to bottom
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  _chatController.chatScrollController.jumpTo(_chatController
                      .chatScrollController.position.maxScrollExtent);
                });
                return ListView.separated(
                  controller: _chatController.chatScrollController,
                  itemCount: _chatController.message.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ChatMessage(
                      message: _chatController.message[index],
                    );
                  },
                  separatorBuilder: ((context, index) {
                    return SpaceHelper.verticalSpaceSmall;
                  }),
                );
              }),
            ),
            SpaceHelper.verticalSpaceMedium,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: 45,
                // width:DeviceInfo(context).width-120 ,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _chatController.messageController,
                        autofocus: false,
                        maxLines: null,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          //  border:_border ,
                          // enabledBorder: _border,
                          //  focusedBorder: _border,
                          hintText: 'Type a message',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: colorDarkAsh),
                        ),
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.black),
                        onEditingComplete: () {},
                        onFieldSubmitted: (value) {},
                        onChanged: (value) {},
                        onTapOutside: (value) {
                          // log('onTapOutside called');
                        },
                      ),
                    ),
                    SpaceHelper.horizontalSpace(5),
                    MaterialButton(
                        splashColor: colorDarkAsh,
                        onPressed: () {
                          if (_chatController
                              .messageController.text.isNotEmpty) {
                            _chatController.addMessage(
                                _chatController.messageController.text);
                            _chatController.messageController.clear();
                          }
                        },
                        height: 35,
                        minWidth: 35,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                        child: const Icon(
                          Icons.send,
                          color: colorDarkAsh,
                        )),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
