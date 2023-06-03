import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rendom_user/user/model/usermodel.dart';

class UserApi
{
  static UserApi userApi=UserApi();

  Future<UserModel> getApi()
  async {
    String? link='https://randomuser.me/api/';
    var response=await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    UserModel userModel=UserModel.fromJson(json);
    return userModel;
  }
}