
import 'package:dartz/dartz.dart';
import 'package:gorouter/core/errors/failure.dart';
import 'package:gorouter/core/utils/typedef.dart';
import 'package:gorouter/features/auth/domain/entities/user.dart';

abstract class AuthRepository{
  const AuthRepository();

  /*So here comes the situation that what if there is a failure while creating a user or get a Users List Failure*/
  /*So in that case we would create a failure class core>failure.dart, so that's why we have created modified the below two classes with the uncommented lines of code*/

  // Future<void> createUser({required String createdAt, required String name, required String avatar});
  // Future<List<User>> getUsers();

 ResultVoid createUser({required String createdAt, required String name, required String avatar});
 ResultFuture<List<User>> getUsers();
}