// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:poc/domain/entities/user_entity.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  final UserEntity userModel;
  HomeInitialState({
    required this.userModel,
  });
}
