import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_search_app/model/issues_model.dart';
import 'package:flutter_search_app/service/issues/issues_repo.dart';

part 'issue_event.dart';
part 'issue_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final IssuesRepository _issuesRepository;

  IssuesBloc(this._issuesRepository) : super(IssuesLoadingState()) {
    on<LoadIssuesEvent>((event, emit) async {
      emit(IssuesLoadingState());
      try {
        final issues = await _issuesRepository.fetchIssuesList();
        emit(IssuesLoadedState(issues));
      } catch (e) {
        emit(IssuesErrorState(e.toString()));
      }
    });
  }
}
