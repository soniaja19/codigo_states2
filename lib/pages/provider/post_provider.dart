import 'package:codigo_states2/services/remote/api_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  List posts = [];

  Future<List> getPosts() async {
    return await apiService.getPosts();
  }

  getPosts2() async {
    posts = await apiService.getPosts();
    notifyListeners();
  }
}
