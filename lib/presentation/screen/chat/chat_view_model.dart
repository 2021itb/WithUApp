import 'package:flutter/material.dart';
import 'package:with_u/data/model/message.dart';
import 'package:with_u/data/repository/chat_repository.dart';

class ChatViewModel with ChangeNotifier {
  final ChatRepository repository;
  bool isLoading = false;
  bool isEmergency = false;

  List<Message> messages = [];

  ChatViewModel({
    required this.repository,
  }) {
    showAllMessages();
  }

  Future<void> showAllMessages() async {
    final data = await repository.getMessages();
    messages = data.reversed.toList();
    notifyListeners();
  }

  Future<void> showRecentMessage() async {
    final data = await repository.getRecentMessage();
    messages.add(data);
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    await repository.sendMessage(isEmergency ? '(긴급) $message' : message);
    messages.add(Message(message: message, role: 'user'));
    isLoading = true;
    isEmergency = false;
    notifyListeners();
    await repository.createRun();
    await showRecentMessage();
    isLoading = false;
    notifyListeners();
  }
}
