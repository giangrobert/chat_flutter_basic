import 'package:flutter/material.dart';
import 'package:project_2/config/helpers/get_yes_no_answer.dart';
import 'package:project_2/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatscrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Cómo estás?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newmessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newmessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToEnd();
  }

  Future<void> herReply() async {
    final hermessage = await getYesNoAnswer.getAnswer();
    messagesList.add(hermessage);
    notifyListeners();
    moveScrollToEnd();
  }

  void moveScrollToEnd() {
    chatscrollController.animateTo(
      chatscrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
