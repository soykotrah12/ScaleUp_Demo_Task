import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<dynamic> _posts = [];
  bool _isLoading = false;

  List<dynamic> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    final response =
    await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      _posts = json.decode(response.body);
    }
    _isLoading = false;
    notifyListeners();
  }
}
