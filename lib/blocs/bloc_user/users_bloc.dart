import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/users_model.dart';
import '../../model/users_model.dart';
import '../../service/users/users_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository _userRepository;

  UsersBloc(this._userRepository) : super(UsersLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UsersLoadingState());
      try {
        final users = await _userRepository.fetchUserList();
        emit(UsersLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
