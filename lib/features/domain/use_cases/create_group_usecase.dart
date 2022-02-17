


import 'package:flutter_app/features/domain/entities/group_entity.dart';
// ignore: unused_import
import 'package:flutter_app/features/domain/entities/my_chat_entity.dart';
import 'package:flutter_app/features/domain/repositories/firebase_repository.dart';

class GetCreateGroupUseCase {
  final FirebaseRepository repository;

  GetCreateGroupUseCase({required this.repository});

  Future<void> call(GroupEntity groupEntity)async{
    return await repository.getCreateGroup(groupEntity);
  }
}