import 'package:clean_architecture_with_bloc/domain/entities/user_entity.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit() : super(UserDetailState.initial());

  void onInt(UserEntity user) {
    emit(state.copyWith(user: user));
  }
}
