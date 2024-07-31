class Message {
  String message;
  String role;

//<editor-fold desc="Data Methods">
  Message({
    required this.message,
    required this.role,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          role == other.role);

  @override
  int get hashCode => message.hashCode ^ role.hashCode;

  @override
  String toString() {
    return 'Message{ message: $message, role: $role,}';
  }

  Message copyWith({
    String? message,
    String? role,
  }) {
    return Message(
      message: message ?? this.message,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'role': this.role,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] as String,
      role: map['role'] as String,
    );
  }

//</editor-fold>
}
