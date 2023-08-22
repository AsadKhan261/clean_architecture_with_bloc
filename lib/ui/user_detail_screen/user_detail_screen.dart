import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_cubit.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_initial_params.dart';
import 'package:clean_architecture_with_bloc/ui/user_detail_screen/user_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailScreen extends StatefulWidget {
  final UserDetailInitialParams user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late UserDetailCubit userDetailCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDetailCubit = BlocProvider.of<UserDetailCubit>(context);
    userDetailCubit.onInt(widget.user.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
        bloc: userDetailCubit,
        builder: (context, state) {
          state as UserDetailState;
          return ListTile(
            title: Text(state.user.name.toString()),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.user.email.toString()),
                Text(state.user.phone.toString()),
                Text(state.user.website.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
