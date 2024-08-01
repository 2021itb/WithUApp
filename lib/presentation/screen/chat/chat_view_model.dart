import 'package:flutter/material.dart';
import 'package:with_u/data/model/message.dart';
import 'package:with_u/data/repository/chat_repository.dart';

class ChatViewModel with ChangeNotifier {
  final ChatRepository repository;

  List<Message> messages = [];

  ChatViewModel({
    required this.repository,
  }) {
    showAllMessages();
  }

  Future<void> showAllMessages() async {
    final data = await repository.getMessages();
    // messages = data.reversed.toList();
    messages = data.toList();
    notifyListeners();
  }

  Future<void> showRecentMessage() async {
    final data = await repository.getRecentMessage();
    messages.insert(0, data);
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    await repository.sendMessage(message);
    messages.insert(0, Message(message: message, role: 'user'));
    // messages.add(Message(message: message, role: 'user'));
    notifyListeners();
    print(messages);
    await repository.createRun();
    await showRecentMessage();
    notifyListeners();
  }
}
