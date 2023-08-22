import 'dart:convert';

import 'package:clean_architecture_with_bloc/user_json.dart';
import 'package:clean_architecture_with_bloc/user_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true,));
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    final users = list.map((e) => UserJson.fromJson(e)).toList();
    emit(state.copyWith(user: users,isLoading: false));
  }
}
