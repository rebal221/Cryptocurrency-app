import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'app_url.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Future getUserData(String email, String pass) async {
    var url = Uri.parse(AppUrl.login);
    http.Response response = await http.post(
      url,
      body: {'email': email, 'pass': pass},
    );
    var data = jsonDecode(response.body);

    if (data.toString() == 'false') {
      print("rong email");
      return false;
    } else {
      print(data.toString());
    }

    return data;
  }
}
