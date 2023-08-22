import 'package:clean_architecture_with_bloc/domain/entities/user_entity.dart';

class UserListState {
  final List<UserEntity> user;
  final bool isLoading;
  final String? error;

  const UserListState({
    required this.user,
    required this.isLoading,
     this.error,
  });

  factory UserListState.initial() => const UserListState(
        user: [],
        isLoading: false,
      );

  UserListState copyWith(
          {List<UserEntity>? user, bool? isLoading, String? error}) =>
      UserListState(
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
