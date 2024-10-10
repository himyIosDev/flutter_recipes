import 'dart:io';

import 'package:flutter_recepies/constants.dart';
import 'package:flutter_recepies/models/user.dart';
import 'package:flutter_recepies/services/http_service.dart';

class AuthService {
  //
  static final AuthService _singleton = AuthService._internal();
  final _httpService = HTTPService();

  User? user;

  factory AuthService() {
    //
    return _singleton;
  }

  AuthService._internal();

// ***************************************************************************

  Future<bool> login(String username, String password) async {
    //
    var param = {
      "username": username,
      "password": password,
    };

    try {
      //
      var response = await _httpService.postRequest(loginApi, param);

      //check response code and print data in console
      if (response?.statusCode == 200 && response?.data != null) {
        //
        user = User.fromJson(response!.data);
        HTTPService().setup(bearerToken: user!.accessToken);
        return true;
      }

      //
    } catch (err) {
      //
      print(err);
    }

    return false;
  }
}
