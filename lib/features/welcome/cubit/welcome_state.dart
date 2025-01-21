import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class WelcomeInitialState extends WelcomeState {}

class WelcomeSignInSuccesstate extends WelcomeState {}
