import 'package:flutter_search_app/model/issues_model.dart';
import 'package:flutter_search_app/service/issues/issues_service.dart';
import 'package:flutter_search_app/service/users/users_service.dart';

class IssuesRepository {
  final _provider = IssuesService();

  Future<List<IssuesModel>> fetchIssuesList() {
    return _provider.fetchIssuesList();
  }
}

class NetworkError extends Error {}
