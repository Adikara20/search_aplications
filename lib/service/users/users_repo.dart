import 'package:flutter_search_app/service/users/users_service.dart';

import '../../model/users_model.dart';

class UserRepository {
  final _provider = UserService();

  Future<List<UsersModel>> fetchUserList() {
    return _provider.fetchUserList();
  }
}

class NetworkError extends Error {}
