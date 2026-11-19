import 'package:flutter/material.dart';

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({super.key, required this.messageId});

  final String messageId;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('消息详情')),
    body: Center(child: Text('MessagePlaceholder $messageId')),
  );
}
