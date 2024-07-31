import 'package:with_u/data/data_source/api.dart';
import 'package:with_u/data/mapper/text_mapper.dart';
import 'package:with_u/data/model/message.dart';
import 'package:with_u/data/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final _dataSource = Api();

  @override
  Future<List<Message>> getMessages() async {
    final data = await _dataSource.getTextDto();
    return data.map((e) => e.toMessage()).toList();
  }
}
