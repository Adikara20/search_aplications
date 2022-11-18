part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class LoadUserEvent extends UsersEvent {
  @override
  List<Object> get props => [];
}

// abstract class UserEventRefresh extends UsersEvent {}

// abstract class UserEventReload extends UsersEvent {}
