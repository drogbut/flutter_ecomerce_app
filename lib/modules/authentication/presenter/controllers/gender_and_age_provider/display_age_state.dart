import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DisplayAgeState {}

class AgesLoading extends DisplayAgeState {}

class AgesLoaded extends DisplayAgeState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> agesSnapshot;
  AgesLoaded({required this.agesSnapshot});
}

class AgesLoadFailure extends DisplayAgeState {
  final String errorMessage;

  AgesLoadFailure({required this.errorMessage});
}
