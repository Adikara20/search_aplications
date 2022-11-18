import 'package:flutter_search_app/model/repositories_model.dart';
import 'package:flutter_search_app/service/repositories/repositories_service.dart';
import 'package:flutter_search_app/service/users/users_service.dart';

import '../../model/users_model.dart';

class RepoRepository {
  final _provider = RepositoriesService();

  Future<List<RepositoriesModel>> fetchRepoList() {
    return _provider.fetchRepoList();
  }
}

class NetworkError extends Error {}
