import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_homework/model/model.dart';
import 'package:http_homework/repo/repo.dart';

class PostProvider with ChangeNotifier {
  PostProvider({required this.repo});

  final Repo repo;
  List<PostModel> posts = [];

  void getPosts() async {
    try {
      final response = await repo.getPosts();
      final data = json.decode(response.body) as List;
      posts = data.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {}
  }
}
