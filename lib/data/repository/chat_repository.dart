import 'package:with_u/data/model/message.dart';

abstract interface class ChatRepository {
  // Future<void> initializeThreadId();

  Future<void> makeThread();

  Future<List<Message>> getMessages();

  Future<Message> getRecentMessage();

  Future<void> sendMessage(String message);

  Future<void> createRun();
}
