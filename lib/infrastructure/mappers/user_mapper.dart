import 'package:pureair_v2/domain/domain.dart';

import '../dtos/dtos.dart';

class UserMapper {
  UserDto? fromDomain(User? entity) {
    if (entity == null) {
      return null;
    }

    return UserDto(
      uid: entity.uid,
      name: entity.name?.get(),
      email: entity.email?.get(),
      avatar: entity.avatar,
      emailVerified: entity.emailVerified,
    );
  }

  User? toDomain(UserDto? dto) {
    if (dto == null) {
      return null;
    }

    return User(
      uid: dto.uid,
      name: dto.name == null ? null : Name(dto.name!),
      email: dto.email == null ? null : Email(dto.email!),
      avatar: dto.avatar,
      emailVerified: dto.emailVerified,
    );
  }
}
