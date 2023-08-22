import 'package:clean_architecture_with_bloc/ui/user_list/user_list_state.dart';
import 'package:clean_architecture_with_bloc/data/rest_api_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListCubit extends Cubit<UserListState> {
  final RestApiUserRepository usersRepository;

  UserListCubit(this.usersRepository) : super(UserListState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final users = await usersRepository.getUsers();
    users.fold((error) => emit(state.copyWith(error: error.toString())),
        (users) => emit(state.copyWith(user: users, isLoading: false)));
  }
}
