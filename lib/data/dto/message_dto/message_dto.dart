import 'data_dto.dart';

class MessageDto {
  String? object;
  List<DataDto>? data;
  String? firstId;
  String? lastId;
  bool? hasMore;

  MessageDto({this.object, this.data, this.firstId, this.lastId, this.hasMore});

  factory MessageDto.fromJson(Map<String, dynamic> json) => MessageDto(
        object: json['object'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstId: json['first_id'] as String?,
        lastId: json['last_id'] as String?,
        hasMore: json['has_more'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'object': object,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_id': firstId,
        'last_id': lastId,
        'has_more': hasMore,
      };
}
