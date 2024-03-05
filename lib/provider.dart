import 'package:apihit/model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  Config? _user;
  Config? get user => _user;

  Future<void> fetchUser() async {
    try {
      final response = await http.get(Uri.parse('https://dev.one.myignite.online/api/v1/config'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body); 
        _user=Config.fromJson(jsonData);
        notifyListeners();
      
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
}
