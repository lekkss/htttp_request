import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_practice/model/post_model.dart';
import 'package:http_practice/services/local_storage_service.dart';
import 'package:http_practice/testing/user.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> postNote() async {
    LocalStorageService ls = await LocalStorageService.getInstance();
    String token = ls.getFromDisk("token");
    var u = ls.getFromDisk("user");
    User user = User.fromJson(jsonDecode(u));

    String _uri =
        "https://salty-tundra-72261.herokuapp.com/note/new/${user.id}";

    Response res = await post(
      Uri.parse(_uri),
      headers: {
        'Content-Type': "application/json",
        'Accept': "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({}),
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(
      Uri.parse(postsURL),
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<void> deletePost(int id) async {
    Response res = await delete(
      Uri.parse("$postsURL/$id"),
    );

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }
}
