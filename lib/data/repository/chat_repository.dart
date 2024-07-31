import 'package:with_u/data/model/message.dart';

abstract interface class ChatRepository {
  Future<List<Message>> getMessages();
}
