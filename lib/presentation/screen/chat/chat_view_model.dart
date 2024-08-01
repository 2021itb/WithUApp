import 'package:flutter/material.dart';
import 'package:with_u/data/model/message.dart';
import 'package:with_u/data/repository/chat_repository.dart';

class ChatViewModel with ChangeNotifier {
  final ChatRepository repository;
  RegExp regex = RegExp(r'【.*?】');
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

    messages = data
        .where((e) => e.message.startsWith('이름:') == false)
        .map((e) =>
            Message(message: e.message.replaceAll(regex, ''), role: e.role))
        .toList();
    notifyListeners();
  }

  Future<void> showRecentMessage() async {
    final data = await repository.getRecentMessage();
    final recentData =
        data.copyWith(message: data.message.replaceAll(regex, ''));
    messages.insert(0, recentData);
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
    await repository.sendMessage(isEmergency ? '(긴급) $message' : message);
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
