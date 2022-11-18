import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_search_app/model/repositories_model.dart';

import '../../service/repositories/repositories_repo.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final RepoRepository _repoRepository;

  RepositoriesBloc(this._repoRepository) : super(RepositoriesLoadingState()) {
    on<LoadRepositoriesEvent>((event, emit) async {
      emit(RepositoriesLoadingState());
      try {
        final users = await _repoRepository.fetchRepoList();
        emit(RepositoriesLoadedState(users));
      } catch (e) {
        emit(RepositoriesErrorState(e.toString()));
      }
    });
  }
}
