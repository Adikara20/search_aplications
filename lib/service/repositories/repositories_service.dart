import 'dart:convert';

import 'package:flutter_search_app/model/repositories_model.dart';
import 'package:http/http.dart';

class RepositoriesService {
  String endpoint = "https://api.github.com/search/repositories?q=doraemon";

  Future<List<RepositoriesModel>> fetchRepoList() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List itemsList = jsonDecode(response.body)["items"];
      return itemsList.map((e) => RepositoriesModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
