part of 'repository_bloc.dart';

@immutable
abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();
}

class LoadRepositoriesEvent extends RepositoriesEvent {
  @override
  List<Object> get props => [];
}
