import 'package:flutter/material.dart';
import 'package:rendom_user/user/helper/user_api.dart';
import 'package:rendom_user/user/model/usermodel.dart';

class UserProvider extends ChangeNotifier{

  UserModel? userModel;
  Future<UserModel?> getData()
  async {
    userModel= await UserApi.userApi.getApi();
    return userModel;
    notifyListeners();
  }

  void rendomuser(user_api)
  {
    userModel=user_api;
    notifyListeners();
  }
}