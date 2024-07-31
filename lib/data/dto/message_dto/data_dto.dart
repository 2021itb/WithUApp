import 'content.dart';
import 'metadata.dart';

class DataDto {
  String? id;
  String? object;
  int? createdAt;
  String? assistantId;
  String? threadId;
  String? runId;
  String? role;
  List<Content>? content;
  List<dynamic>? attachments;
  Metadata? metadata;

  DataDto({
    this.id,
    this.object,
    this.createdAt,
    this.assistantId,
    this.threadId,
    this.runId,
    this.role,
    this.content,
    this.attachments,
    this.metadata,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) => DataDto(
        id: json['id'] as String?,
        object: json['object'] as String?,
        createdAt: json['created_at'] as int?,
        assistantId: json['assistant_id'] as String?,
        threadId: json['thread_id'] as String?,
        runId: json['run_id'] as String?,
        role: json['role'] as String?,
        content: (json['content'] as List<dynamic>?)
            ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
            .toList(),
        attachments: json['attachments'] as List<dynamic>?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'created_at': createdAt,
        'assistant_id': assistantId,
        'thread_id': threadId,
        'run_id': runId,
        'role': role,
        'content': content?.map((e) => e.toJson()).toList(),
        'attachments': attachments,
        'metadata': metadata?.toJson(),
      };
}
