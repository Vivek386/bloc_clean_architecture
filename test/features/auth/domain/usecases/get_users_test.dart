import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gorouter/features/auth/domain/entities/user.dart';
import 'package:gorouter/features/auth/domain/repositories/auth_repository.dart';
import 'package:gorouter/features/auth/domain/usecases/create_user.dart';
import 'package:gorouter/features/auth/domain/usecases/get_users.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';



void main(){
  late GetUsers usecase;
  late AuthRepository repository;
  
  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });
  
  const usersList = [User.empty()];

  test('should call the [AuthRepo.getUsers] and t should return a List<User>', () async{
    // Arrange
    when(() => repository.getUsers()).thenAnswer((_) async =>  const Right(usersList));
    //Act
    final result = await usecase();
    //Assert
    expect(result, equals(const Right<dynamic,List<User>>(usersList)));
    verify(()=> repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
