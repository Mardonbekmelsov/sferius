
import 'package:sferius_ai/features/sfereius/data/models/chat_model.dart';

class ChatEntity {
  String id;
  int userId;
  String title;
  String systemRole;
  String status;
  int messageCount;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt;

  ChatEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.systemRole,
    required this.status,
    required this.messageCount,
    required this.createdAt,
    required this.updatedAt,
  });
}

extension ChatToEntity on ChatModel {
  ChatEntity toEntity() {
    return ChatEntity(
      id: id,
      userId: user_id,
      title: title,
      systemRole: system_role,
      status: status,
      messageCount: message_count,
      createdAt: created_at,
      updatedAt: updated_at,
    );
  }
}

extension ChatToModel on ChatEntity {
  ChatModel toModel() {
    return ChatModel(
      id: id,
      user_id: userId,
      title: title,
      system_role: systemRole,
      status: status,
      message_count: messageCount,
      created_at: createdAt,
      updated_at: updatedAt,
    );
  }
}
