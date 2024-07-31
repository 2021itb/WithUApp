class Message {
  String message;

//<editor-fold desc="Data Methods">
  Message({
    required this.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          runtimeType == other.runtimeType &&
          message == other.message);

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'Message{ message: $message,}';
  }

  Message copyWith({
    String? message,
  }) {
    return Message(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] as String,
    );
  }

//</editor-fold>
}
