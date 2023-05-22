import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class Loading extends UsersState {}

class Loaded extends UsersState {
  final List<User> users;

  const Loaded({required this.users});

  @override
  List<Object> get props => [users];
}

class Error extends UsersState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
