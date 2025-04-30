
import 'package:sferius_ai/features/profile/data/models/user_me_model.dart';

class UserMeEntity {
  String avatar;
  String created_at;
  String date_of_birth;
  String email;
  String first_name;
  String gender;
  int id;
  String last_name;
  String phone;
  int pro_id;
  String role;
  String updated_at;

  UserMeEntity({
    required this.avatar,
    required this.created_at,
    required this.date_of_birth,
    required this.email,
    required this.first_name,
    required this.gender,
    required this.id,
    required this.last_name,
    required this.phone,
    required this.pro_id,
    required this.role,
    required this.updated_at,
  });
}

extension ModelToEntity on UserMeModel {
  UserMeEntity toEntity() {
    return UserMeEntity(
        avatar: avatar,
        created_at: created_at,
        date_of_birth: date_of_birth,
        email: email ?? '',
        first_name: first_name,
        gender: gender ?? "",
        id: id,
        last_name: last_name,
        phone: phone,
        pro_id: pro_id,
        role: role,
        updated_at: updated_at);
  }
}
