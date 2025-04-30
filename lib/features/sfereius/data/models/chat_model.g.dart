// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => _ChatModel(
  id: json['id'] as String,
  user_id: (json['user_id'] as num).toInt(),
  title: json['title'] as String,
  system_role: json['system_role'] as String,
  status: json['status'] as String,
  message_count: (json['message_count'] as num).toInt(),
  created_at: DateTime.parse(json['created_at'] as String),
  updated_at: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ChatModelToJson(_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'title': instance.title,
      'system_role': instance.system_role,
      'status': instance.status,
      'message_count': instance.message_count,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
    };
