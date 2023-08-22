import 'dart:convert';
import 'package:clean_architecture_with_bloc/data/user_json.dart';
import 'package:clean_architecture_with_bloc/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../domain/failure/user_list_failure.dart';
import '../domain/repositories/user_repository.dart';

class RestApiUserRepository implements UserRepository {
  @override
  Future<Either<UserListFailure, List<UserEntity>>> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      var list = jsonDecode(response.body) as List;
      return Right(list.map((e) => UserJson.fromJson(e).toDomain()).toList());
    } catch (ex) {
      return left(UserListFailure(message: ex.toString()));
    }
  }
}
