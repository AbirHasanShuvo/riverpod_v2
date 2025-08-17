import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_v2/models/user_models.dart';

class ApiServices {
  String endpoint = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
final userString = Provider(<String>(ref) => 'Hello there');
