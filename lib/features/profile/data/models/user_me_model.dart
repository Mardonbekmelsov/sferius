// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_me_model.freezed.dart';
part 'user_me_model.g.dart';

@freezed
class UserMeModel with _$UserMeModel {
  factory UserMeModel({
    required String avatar,
    required String created_at,
    required String date_of_birth,
    required String? email,
    required String first_name,
    required String? gender,
    required int id,
    required String last_name,
    required String phone,
    required int pro_id,
    required String role,
    required String updated_at,
  }) = _UserMeModel;

  factory UserMeModel.fromJson(Map<String, dynamic> json) =>
      _$UserMeModelFromJson(json);



  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
