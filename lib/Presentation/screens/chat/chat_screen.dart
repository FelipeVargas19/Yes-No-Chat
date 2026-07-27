import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/Domain/entities/message.dart';
import 'package:yes_no_app/Presentation/Providers/chat_provider.dart';
import 'package:yes_no_app/Presentation/Widgets/Chat/her_message_bubble.dart';
import 'package:yes_no_app/Presentation/Widgets/Chat/my_message_bubble.dart';
import 'package:yes_no_app/Presentation/Widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/77/fe/2f/77fe2f13e8837455e8aa6b8beb7b0f8d.jpg',
            ),
          ),
        ),
        title: Text('MercyUwU'),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                  ?const HerMessageBubble()
                  :MyMessageBubble(message:message, );
                },
              ),
            ),
          //CAJA DE TEXTO DE MENSAJES
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
