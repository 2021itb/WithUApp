import 'package:flutter/material.dart';
import 'package:with_u/ui/text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'With U',
          style: TextStyles.headingH4,
        ),
      ),
    );
  }
}
