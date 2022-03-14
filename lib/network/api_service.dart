import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_listview/network/network_notification.dart';
import 'package:infinite_listview/models/model.dart';

class APIHelper {
  static Future<HTTPResponse<List<PostModel>>> getPosts(
      {int page = 1, int limit = 20}) async {
    try {
      var response = await http.get(
        Uri.parse('https://picsum.photos/v2/list?page=$page&limit=$limit'),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<PostModel> posts = [];
        body.forEach((e) {
          PostModel post = PostModel.fromJson(e);
          posts.add(post);
        });
        return HTTPResponse<List<PostModel>>(
          true,
          posts,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('UNEXPECTED ERROR');
      }
      if (kDebugMode) {
        print(e.toString());
      }
    }

    return getPosts();
  }
}
