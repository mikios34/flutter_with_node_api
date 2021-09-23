import 'package:equatable/equatable.dart';
import 'package:flutter_signup_and_signin_with_node/models/user.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UsersLoadSuccess extends UserState {
  final List<User> users;

  UsersLoadSuccess([this.users = const []]);

  @override
  List<Object> get props => [users];
}

class UserOperationFailure extends UserState {}
