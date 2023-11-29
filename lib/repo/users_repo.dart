
import 'package:api/Models/usermodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class UsersRepo {
  Future<List<UserModel>> getUsers() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
            if (kDebugMode) {
              print("Data Get Successfully");
            }
      List<UserModel> usersModels = userModelFromJson(response.body);
      return usersModels; 
    } else {
      throw Exception("Failed to load Users");
    }
  }
}
