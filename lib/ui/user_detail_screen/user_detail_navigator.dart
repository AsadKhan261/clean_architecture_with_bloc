import 'package:clean_architecture_with_bloc/navigation/app_navigator.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_initial_params.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UserDetailNavigator {}

mixin UserDetailRoute {
  openUserDetail(UserDetailInitialParams params) {
    navigator.push(context,
        UserDetailScreen(user: UserDetailInitialParams(user: params.user)));
  }

  BuildContext get context;

  AppNavigator get navigator;
}
