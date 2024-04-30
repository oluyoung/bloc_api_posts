import 'dart:convert';

import 'package:http/http.dart';
import './model.dart';

class PostRepository {
  String endpoint = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<PostModel>> getPosts() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      return List<PostModel>.from(result.map((e) => PostModel.fromJson(e)));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
