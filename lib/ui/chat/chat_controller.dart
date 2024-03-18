import 'package:carnotautomart/ui/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<MessageResponse> message = <MessageResponse>[].obs;
  TextEditingController messageController = TextEditingController();
  ScrollController chatScrollController = ScrollController();

  void scrollToBottom() {
    final bottomOffset = chatScrollController.position.maxScrollExtent;
    chatScrollController.animateTo(
      bottomOffset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  addMessage(String text) {
    message.add(MessageResponse(timeFormat(DateTime.now().toString()), text));
    scrollToBottom();
  }
}

class MessageResponse {
  String? currentDateTime;
  String? message;
  MessageResponse(this.currentDateTime, this.message);
}
