import 'package:with_u/data/data_source/api.dart';
import 'package:with_u/data/mapper/text_mapper.dart';
import 'package:with_u/data/model/message.dart';
import 'package:with_u/data/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final _dataSource = Api();

  // @override
  // Future<void> initializeThreadId() async {
  //   await _dataSource.initializeThreadId();
  // }

  @override
  Future<void> makeThread() async {
    await _dataSource.makeThread();
  }

  @override
  Future<List<Message>> getMessages() async {
    final data = await _dataSource.getDataDto();
    return data.map((e) => e.toMessage()).toList();
  }

  @override
  Future<Message> getRecentMessage() async {
    final data = await _dataSource.getDataDto();
    return data.map((e) => e.toMessage()).toList()[0];
  }

  @override
  Future<void> createRun() async {
    await _dataSource.createRun();
  }

  @override
  Future<void> sendMessage(String message) async {
    await _dataSource.addMessageToTheThread(message);
  }
}
