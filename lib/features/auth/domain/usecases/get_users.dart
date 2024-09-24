import 'package:gorouter/core/usecase/usecase.dart';
import 'package:gorouter/core/utils/typedef.dart';
import 'package:gorouter/features/auth/domain/repositories/auth_repository.dart';

import '../entities/user.dart';

class GetUsers extends UsecaseWithoutParams<List<User>>{

  GetUsers(this._repository);
  final AuthRepository _repository;

  @override
  ResultFuture<List<User>> call()async => _repository.getUsers();
}