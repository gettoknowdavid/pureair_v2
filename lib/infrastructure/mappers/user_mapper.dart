import 'package:pureair_v2/domain/domain.dart';

import '../dtos/dtos.dart';

class UserMapper {
  UserDto? fromDomain(User? entity) {
    if (entity == null) {
      return null;
    }

    return UserDto(
      uid: entity.uid,
      name: entity.name.get()!,
      email: entity.email.get()!,
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
      name: Name(dto.name),
      email: Email(dto.email),
      avatar: dto.avatar,
      emailVerified: dto.emailVerified,
    );
  }
}
