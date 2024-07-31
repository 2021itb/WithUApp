import 'package:with_u/data/dto/message_dto/text.dart';
import 'package:with_u/data/model/message.dart';

extension TextMapper on TextDto {
  Message toMessage() {
    return Message(message: value ?? '', );
  }
}
