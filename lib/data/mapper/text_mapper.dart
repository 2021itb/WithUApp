import 'package:with_u/data/dto/message_dto/data_dto.dart';
import 'package:with_u/data/model/message.dart';

extension DataMapper on DataDto {
  Message toMessage() {
    return Message(message: content![0].text!.value ?? '', role: role ?? '');
  }
}