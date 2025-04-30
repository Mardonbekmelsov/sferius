// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_me_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMeModel {

 String get avatar; String get created_at; String get date_of_birth; String? get email; String get first_name; String? get gender; int get id; String get last_name; String get phone; int get pro_id; String get role; String get updated_at;
/// Create a copy of UserMeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMeModelCopyWith<UserMeModel> get copyWith => _$UserMeModelCopyWithImpl<UserMeModel>(this as UserMeModel, _$identity);

  /// Serializes this UserMeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMeModel&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.date_of_birth, date_of_birth) || other.date_of_birth == date_of_birth)&&(identical(other.email, email) || other.email == email)&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pro_id, pro_id) || other.pro_id == pro_id)&&(identical(other.role, role) || other.role == role)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatar,created_at,date_of_birth,email,first_name,gender,id,last_name,phone,pro_id,role,updated_at);

@override
String toString() {
  return 'UserMeModel(avatar: $avatar, created_at: $created_at, date_of_birth: $date_of_birth, email: $email, first_name: $first_name, gender: $gender, id: $id, last_name: $last_name, phone: $phone, pro_id: $pro_id, role: $role, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class $UserMeModelCopyWith<$Res>  {
  factory $UserMeModelCopyWith(UserMeModel value, $Res Function(UserMeModel) _then) = _$UserMeModelCopyWithImpl;
@useResult
$Res call({
 String avatar, String created_at, String date_of_birth, String? email, String first_name, String? gender, int id, String last_name, String phone, int pro_id, String role, String updated_at
});




}
/// @nodoc
class _$UserMeModelCopyWithImpl<$Res>
    implements $UserMeModelCopyWith<$Res> {
  _$UserMeModelCopyWithImpl(this._self, this._then);

  final UserMeModel _self;
  final $Res Function(UserMeModel) _then;

/// Create a copy of UserMeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatar = null,Object? created_at = null,Object? date_of_birth = null,Object? email = freezed,Object? first_name = null,Object? gender = freezed,Object? id = null,Object? last_name = null,Object? phone = null,Object? pro_id = null,Object? role = null,Object? updated_at = null,}) {
  return _then(_self.copyWith(
avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,created_at: null == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String,date_of_birth: null == date_of_birth ? _self.date_of_birth : date_of_birth // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,first_name: null == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,last_name: null == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,pro_id: null == pro_id ? _self.pro_id : pro_id // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,updated_at: null == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserMeModel implements UserMeModel {
   _UserMeModel({required this.avatar, required this.created_at, required this.date_of_birth, required this.email, required this.first_name, required this.gender, required this.id, required this.last_name, required this.phone, required this.pro_id, required this.role, required this.updated_at});
  factory _UserMeModel.fromJson(Map<String, dynamic> json) => _$UserMeModelFromJson(json);

@override final  String avatar;
@override final  String created_at;
@override final  String date_of_birth;
@override final  String? email;
@override final  String first_name;
@override final  String? gender;
@override final  int id;
@override final  String last_name;
@override final  String phone;
@override final  int pro_id;
@override final  String role;
@override final  String updated_at;

/// Create a copy of UserMeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMeModelCopyWith<_UserMeModel> get copyWith => __$UserMeModelCopyWithImpl<_UserMeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMeModel&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.date_of_birth, date_of_birth) || other.date_of_birth == date_of_birth)&&(identical(other.email, email) || other.email == email)&&(identical(other.first_name, first_name) || other.first_name == first_name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.last_name, last_name) || other.last_name == last_name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.pro_id, pro_id) || other.pro_id == pro_id)&&(identical(other.role, role) || other.role == role)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatar,created_at,date_of_birth,email,first_name,gender,id,last_name,phone,pro_id,role,updated_at);

@override
String toString() {
  return 'UserMeModel(avatar: $avatar, created_at: $created_at, date_of_birth: $date_of_birth, email: $email, first_name: $first_name, gender: $gender, id: $id, last_name: $last_name, phone: $phone, pro_id: $pro_id, role: $role, updated_at: $updated_at)';
}


}

/// @nodoc
abstract mixin class _$UserMeModelCopyWith<$Res> implements $UserMeModelCopyWith<$Res> {
  factory _$UserMeModelCopyWith(_UserMeModel value, $Res Function(_UserMeModel) _then) = __$UserMeModelCopyWithImpl;
@override @useResult
$Res call({
 String avatar, String created_at, String date_of_birth, String? email, String first_name, String? gender, int id, String last_name, String phone, int pro_id, String role, String updated_at
});




}
/// @nodoc
class __$UserMeModelCopyWithImpl<$Res>
    implements _$UserMeModelCopyWith<$Res> {
  __$UserMeModelCopyWithImpl(this._self, this._then);

  final _UserMeModel _self;
  final $Res Function(_UserMeModel) _then;

/// Create a copy of UserMeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatar = null,Object? created_at = null,Object? date_of_birth = null,Object? email = freezed,Object? first_name = null,Object? gender = freezed,Object? id = null,Object? last_name = null,Object? phone = null,Object? pro_id = null,Object? role = null,Object? updated_at = null,}) {
  return _then(_UserMeModel(
avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,created_at: null == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String,date_of_birth: null == date_of_birth ? _self.date_of_birth : date_of_birth // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,first_name: null == first_name ? _self.first_name : first_name // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,last_name: null == last_name ? _self.last_name : last_name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,pro_id: null == pro_id ? _self.pro_id : pro_id // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,updated_at: null == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
