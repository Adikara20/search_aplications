part of 'users_bloc.dart';

@immutable
abstract class UsersState extends Equatable {}

class UsersLoadingState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  UsersLoadedState(this.users);
  final List<UsersModel> users;
  @override
  List<Object> get props => [users];
}

class UserErrorState extends UsersState {
  UserErrorState(this.errors);
  String errors;
  @override
  List<Object> get props => [errors];
}
