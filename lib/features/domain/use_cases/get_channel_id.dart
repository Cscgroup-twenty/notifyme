


import 'package:flutter_app/features/domain/entities/engage_user_entity.dart';
import 'package:flutter_app/features/domain/repositories/firebase_repository.dart';

class GetChannelIdUseCase{
  final FirebaseRepository repository;

  GetChannelIdUseCase({required this.repository});

  Future<String> call(EngageUserEntity engageUserEntity) async{
    return repository.getChannelId(engageUserEntity);
  }
}