part of 'issue_bloc.dart';

@immutable
abstract class IssuesState extends Equatable {}

class IssuesLoadingState extends IssuesState {
  @override
  List<Object> get props => [];
}

class IssuesLoadedState extends IssuesState {
  IssuesLoadedState(this.issues);
  final List<IssuesModel> issues;
  @override
  List<Object> get props => [issues];
}

class IssuesErrorState extends IssuesState {
  IssuesErrorState(this.errors);
  String errors;
  @override
  List<Object> get props => [errors];
}
