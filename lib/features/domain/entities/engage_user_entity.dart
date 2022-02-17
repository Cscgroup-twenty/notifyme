import 'package:equatable/equatable.dart';

class EngageUserEntity extends Equatable {
  final String? uid;
  final String? otherUid;

  EngageUserEntity({
    this.uid,
    this.otherUid,
  });

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [uid, otherUid];
}
