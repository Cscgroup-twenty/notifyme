







import 'package:flutter_app/features/domain/entities/user_entity.dart';
import 'package:flutter_app/features/domain/repositories/firebase_repository.dart';

class SignInUseCase{
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user){
    return repository.signIn(user);
  }
}