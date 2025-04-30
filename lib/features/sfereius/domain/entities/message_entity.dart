
import 'package:sferius_ai/features/sfereius/data/models/message_model.dart';

class MessageEntity {
  String role;
  String content;

  MessageEntity({required this.role, required this.content});
}

extension MessageModelEntity on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
      role: role,
      content: content,
    );
  }
}
