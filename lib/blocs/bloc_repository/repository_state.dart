part of 'repository_bloc.dart';

@immutable
abstract class RepositoriesState extends Equatable {}

class RepositoriesLoadingState extends RepositoriesState {
  @override
  List<Object> get props => [];
}

class RepositoriesLoadedState extends RepositoriesState {
  RepositoriesLoadedState(this.users);
  final List<RepositoriesModel> users;
  @override
  List<Object> get props => [users];
}

class RepositoriesErrorState extends RepositoriesState {
  RepositoriesErrorState(this.errors);
  String errors;
  @override
  List<Object> get props => [errors];
}
