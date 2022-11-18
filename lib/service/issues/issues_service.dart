import 'dart:convert';

import 'package:flutter_search_app/model/issues_model.dart';
import 'package:http/http.dart';

class IssuesService {
  String endpoint = "https://api.github.com/search/issues?q=doraemon";

  Future<List<IssuesModel>> fetchIssuesList() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List itemsList = jsonDecode(response.body)["items"];
      return itemsList.map((e) => IssuesModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
