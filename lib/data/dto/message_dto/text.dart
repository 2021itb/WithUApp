class TextDto {
  String? value;
  List<dynamic>? annotations;

  TextDto({this.value, this.annotations});

  factory TextDto.fromJson(Map<String, dynamic> json) => TextDto(
        value: json['value'] as String?,
        annotations: json['annotations'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'annotations': annotations,
      };
}
