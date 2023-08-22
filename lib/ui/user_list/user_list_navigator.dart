import 'package:clean_architecture_with_bloc/navigation/app_navigator.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_navigator.dart';
import 'package:clean_architecture_with_bloc/ui/user_list/user_list_initial_params.dart';
import 'package:clean_architecture_with_bloc/ui/user_list/user_list_page.dart';
import 'package:flutter/material.dart';

class UserListNavigator with UserDetailRoute {
  UserListNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  late AppNavigator navigator;
}

mixin UserListRoute {
  openUserListRoute(UserListInitialParams params) {
    navigator.push(context, const UsersListPage());
  }

  BuildContext get context;

  AppNavigator get navigator;
}
