import 'package:clean_architecture_with_bloc/navigation/app_navigator.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_cubit.dart';
import 'package:clean_architecture_with_bloc/ui/user_list/user_list_cubit.dart';
import 'package:clean_architecture_with_bloc/ui/user_list/user_list_navigator.dart';
import 'package:clean_architecture_with_bloc/ui/user_list/user_list_page.dart';
import 'package:clean_architecture_with_bloc/data/rest_api_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<RestApiUserRepository>(RestApiUserRepository());
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UserListNavigator>(UserListNavigator(getIt()));

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UserListCubit(getIt(),getIt())..fetchUsers()),
    BlocProvider(create: (context) => UserDetailCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UsersListPage(),
    );
  }
}
