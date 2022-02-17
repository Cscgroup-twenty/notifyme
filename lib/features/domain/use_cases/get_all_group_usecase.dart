



// ignore_for_file: unused_import

import 'package:flutter_app/features/domain/entities/group_entity.dart';
import 'package:flutter_app/features/domain/entities/user_entity.dart';
import 'package:flutter_app/features/domain/repositories/firebase_repository.dart';

class GetAllGroupsUseCase{
  final FirebaseRepository repository;

  GetAllGroupsUseCase({required this.repository});

  Stream<List<GroupEntity>> call(){
    return repository.getGroups();
  }
}