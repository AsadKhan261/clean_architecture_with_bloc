import 'package:clean_architecture_with_bloc/domain/entities/user_entity.dart';
import 'package:clean_architecture_with_bloc/domain/failure/user_list_failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<UserListFailure, List<UserEntity>>> getUsers();
}
