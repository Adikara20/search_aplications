part of 'issue_bloc.dart';

@immutable
abstract class IssuesEvent extends Equatable {
  const IssuesEvent();
}

class LoadIssuesEvent extends IssuesEvent {
  @override
  List<Object> get props => [];
}
