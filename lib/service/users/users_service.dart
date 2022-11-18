import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:http/http.dart';

import '../../model/users_model.dart';

class UserService {
  String endpoint = "https://api.github.com/search/users?q=doraemon";

  Future<List<UsersModel>> fetchUserList() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List itemsList = jsonDecode(response.body)["items"];
      return itemsList.map((e) => UsersModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

// class UserService {
//   final Dio _dio = Dio();
//   final String _url = 'https://api.github.com/search/users?q=doraemon';

//   Future<UsersModel> fetchUsersList() async {
//     try {
//       Response response = await _dio.get(_url);
//       print("masuk");
//       print(response.data);
//       return UsersModel.fromJson(response.data);
//     } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       return UsersModel.withError(false, 0, []);
//     }
//   }
// }
