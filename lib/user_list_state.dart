import 'package:clean_architecture_with_bloc/user_json.dart';

class UserListState {
  final List<UserJson> user;
  final bool isLoading;

  const UserListState({
    required this.user,
    required this.isLoading,
  });

  factory UserListState.initial() => const UserListState(
        user: [],
        isLoading: false,
      );

  UserListState copyWith({List<UserJson>? user, bool? isLoading}) =>
      UserListState(
        user: user ?? this.user,
        isLoading: isLoading ?? this.isLoading,
      );
}
