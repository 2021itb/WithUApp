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
    init();
  }

  Future<void> init() async {
    await showAllMessages();
    await addFirstMessage();
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

  Future<void> addFirstMessage() async {
    messages.insert(
        0,
        Message(
            message: '입력하신 개인정보는 더 좋은 답변을 드리기위해서만 활용됩니다 :)',
            role: 'assistant'));
  }

  Future<void> sendMessage(String message) async {
    await repository.sendMessage(message);
    messages.insert(0, Message(message: message, role: 'user'));
    isLoading = true;
    isEmergency = false;
    notifyListeners();
    await repository.createRun();
    await showRecentMessage();
    isLoading = false;
    notifyListeners();
  }
}
