// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

const _$$_UserDtoFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'email': 'email',
  'avatar': 'avatar',
  'verified': 'verified',
};

@Collection<UserDto>('users')
final usersRef = UserDtoCollectionReference();

@freezed
@JsonSerializable(createFactory: false)
class UserDto with _$UserDto {
  const factory UserDto({
    required String uid,
    String? name,
    String? email,
    String? avatar,
    bool? emailVerified,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
