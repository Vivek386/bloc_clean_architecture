import 'package:equatable/equatable.dart';
import 'package:gorouter/core/usecase/usecase.dart';
import 'package:gorouter/core/utils/typedef.dart';
import 'package:gorouter/features/auth/domain/repositories/auth_repository.dart';

/*We have created use case in the core folder with parameters and without parameters*/
class CreateUser extends UsecaseWithParams<void, CreateUserParams>{

  CreateUser(this._repository);

  final AuthRepository _repository;

  // ResultVoid createUser({
  //   required String createdAt,
  //   required String name,
  //   required String avatar
  // }) async =>
  //     _repository.createUser(createdAt: createdAt, name: name, avatar: avatar);

  @override
  ResultVoid call(CreateUserParams params) async =>
      _repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar
      );
}

class CreateUserParams extends Equatable{
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams.empty() :
      this(createdAt: "",name:  "", avatar: "");

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar
});

  @override
  // TODO: implement props
  List<Object?> get props => [createdAt,name,avatar];
}