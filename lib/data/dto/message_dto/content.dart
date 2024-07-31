import 'text.dart';

class Content {
  String? type;
  TextDto? text;

  Content({this.type, this.text});

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json['type'] as String?,
        text: json['text'] == null
            ? null
            : TextDto.fromJson(json['text'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'text': text?.toJson(),
      };
}
