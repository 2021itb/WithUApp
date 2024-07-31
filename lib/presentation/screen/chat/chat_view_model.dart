import 'package:flutter/material.dart';
import 'package:with_u/data/repository/chat_repository.dart';

class ChatViewModel with ChangeNotifier {
  final ChatRepository repository;

  List<String> messages = [];

  ChatViewModel({
    required this.repository,
  }) {
    showAllMessages();
  }

  Future<void> showAllMessages() async {
    final data = await repository.getMessages();
    messages = data.map((e) => e.message).toList();
    notifyListeners();
  }


}
