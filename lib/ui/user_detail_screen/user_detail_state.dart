import 'package:clean_architecture_with_bloc/domain/entities/user_entity.dart';

class UserDetailState {
  final UserEntity user;

  const UserDetailState({
    required this.user,
  });

  factory UserDetailState.initial() =>
      const UserDetailState(user: UserEntity.empty());

  UserDetailState copyWith({
    UserEntity? user,
  }) =>
      UserDetailState(
        user: user ?? this.user,
      );
}
