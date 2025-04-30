// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMeModel _$UserMeModelFromJson(Map<String, dynamic> json) => _UserMeModel(
  avatar: json['avatar'] as String,
  created_at: json['created_at'] as String,
  date_of_birth: json['date_of_birth'] as String,
  email: json['email'] as String?,
  first_name: json['first_name'] as String,
  gender: json['gender'] as String?,
  id: (json['id'] as num).toInt(),
  last_name: json['last_name'] as String,
  phone: json['phone'] as String,
  pro_id: (json['pro_id'] as num).toInt(),
  role: json['role'] as String,
  updated_at: json['updated_at'] as String,
);

Map<String, dynamic> _$UserMeModelToJson(_UserMeModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'created_at': instance.created_at,
      'date_of_birth': instance.date_of_birth,
      'email': instance.email,
      'first_name': instance.first_name,
      'gender': instance.gender,
      'id': instance.id,
      'last_name': instance.last_name,
      'phone': instance.phone,
      'pro_id': instance.pro_id,
      'role': instance.role,
      'updated_at': instance.updated_at,
    };
