import 'package:clean_architecture_with_bloc/ui/user_list/user_list_cubit.dart';
import 'package:clean_architecture_with_bloc/ui/user_list/user_list_state.dart';
import 'package:clean_architecture_with_bloc/ui/widgets/user_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<UserListCubit>(context),
          builder: (context, state) {
            final userState = state as UserListState;
            if (userState.error != null) {
              return Text(userState.error.toString());
            }
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: userState.user
                        .map((user) => UserCard(user: user))
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
