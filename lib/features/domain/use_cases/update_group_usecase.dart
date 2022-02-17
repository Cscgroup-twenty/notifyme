



// ignore_for_file: unused_import

import 'package:flutter_app/features/domain/entities/group_entity.dart';
import 'package:flutter_app/features/domain/entities/user_entity.dart';
import 'package:flutter_app/features/domain/repositories/firebase_repository.dart';

class UpdateGroupUseCase{
  final FirebaseRepository repository;

  UpdateGroupUseCase({required this.repository});
  Future<void> call(GroupEntity groupEntity){
    return repository.updateGroup(groupEntity);
  }

}