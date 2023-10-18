import 'package:flutter/material.dart';
import 'package:project_2/domain/entities/message.dart';
import 'package:project_2/presentation/providers/chat_provider.dart';
import 'package:project_2/presentation/widgets/chat/her_message_bubble.dart';
import 'package:project_2/presentation/widgets/chat/my_message_bubble.dart';
import 'package:project_2/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/foto-gratis/primer-plano-hombre-barbudo-impresionado-dice-wow_176420-18787.jpg'),
          ),
        ),
        title: const Text('Chat ❤'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatscrollController,
                  itemCount: chatProvider.messagesList.length,
                  itemBuilder: (context, index) {
                    final  message = chatProvider.messagesList[index];
                    return message.fromWho ==  FromWho.hers ?  HerMessageBubble(message: message,) : MyMessageBubble(message: message);
                  },
              ),
            ),
            //Caja de Texto

            MessageFieldBox(
              onSubmitted: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}