



import 'package:flutter_app/features/domain/entities/my_chat_entity.dart';
import 'package:flutter_app/features/domain/repositories/firebase_repository.dart';

class CreateNewGroupUseCase{
  final FirebaseRepository repository;

  CreateNewGroupUseCase({required this.repository});

  Future<void> call(MyChatEntity myChatEntity,List<String> selectUserList)async{
    return repository.createNewGroup(myChatEntity, selectUserList);
  }

}