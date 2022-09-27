import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mining_sett/components/app_url.dart';
import 'package:mining_sett/domain/user.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
  static Status _loggedInStatus = Status.NotLoggedIn;
  // Status _registeredInStatus = Status.NotRegistered;
  static String _registeredInStatus = "faild888888888888888";
  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  String get regesterStatus => _registeredInStatus;
  set regesterStatus(String value1) {
    _registeredInStatus = value1;
  }

  Future login(String email) async {
    var url = Uri.parse(AppUrl.login);
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    http.Response response = await http.post(url, body: {'email': email});
    var data = jsonDecode(response.body);

    return data;
    // if (data.toString() == 'false') {
    //   print("rong email");
    //   return data;
    // } else {
    //   return data;
    //   // print(data.toString());
    // }

    return data;
  }

  Future addpost(String userName, String post, String rateing) async {
    var url = Uri.parse(AppUrl.addpost);
    http.Response response = await http
        .post(url, body: {'name': userName, 'post': post, 'rate': rateing});
    var data = jsonDecode(response.body);

    return data;
  }

  Future get_Blogs() async {
    var url = Uri.parse(AppUrl.get_blogs);
    var resault;
    http.Response response = await http.post(url, body: {});
    var data = jsonDecode(response.body);
    List blogs = [];
    for (var u in data['data']) {
      blogs.add(u);
    }

    // print("DATA: ${blogs[0]['User_name']}");

    return blogs;
  }

  Future get_det() async {
    var url = Uri.parse(AppUrl.get_det);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {'User_Id': user_id});
    var data = jsonDecode(response.body);
    return data;
  }

  Future last7Day() async {
    var url = Uri.parse(AppUrl.last7Day);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {'User_Id': user_id});
    var data = jsonDecode(response.body);
    return data;
  }

  Future get_Statistics() async {
    var url = Uri.parse(AppUrl.get_Statistics);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {'User_Id': user_id});
    var data = jsonDecode(response.body);
    return data;
  }

  Future get_Sta_det() async {
    var url = Uri.parse(AppUrl.get_Sta_det);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {'User_Id': user_id});
    var data = jsonDecode(response.body);
    return data;
  }

  Future get_miners() async {
    var url = Uri.parse(AppUrl.get_miners);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {'User_Id': user_id});
    var data = jsonDecode(response.body);
    List miners = [];
    for (var u in data['data']) {
      miners.add(u);
    }
    return miners;
  }

  Future get_requ() async {
    var url = Uri.parse(AppUrl.get_requ);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {'User_Id': user_id});
    var data = jsonDecode(response.body);
    List miners = [];
    for (var u in data['data']) {
      miners.add(u);
    }

    // print("DATA: ${blogs[0]['User_name']}");

    return miners;
  }

  Future getUser(String email) async {
    var url = Uri.parse(AppUrl.getUser);
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    http.Response response = await http.post(url, body: {'email': email});
    var data = jsonDecode(response.body);

    return data;
  }

  Future get_AccountUser() async {
    var url = Uri.parse(AppUrl.getUser);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email3').toString();
    http.Response response = await http.post(url, body: {'email': email});
    var data = jsonDecode(response.body);
    return data;
  }

  Future get_setting() async {
    var url = Uri.parse(AppUrl.get_setting);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await http.post(url);
    var data = jsonDecode(response.body);
    // prefs.setDouble('Income_day', double.parse(data['data'][0]['Income_day']));
    prefs.setDouble(
        'Referral_income', double.parse(data['data'][0]['Referral_income']));
    return data;
  }

  Future get_price() async {
    var url = Uri.parse(AppUrl.get_price);
    http.Response response = await http.post(url);
    var data = jsonDecode(response.body);

    // var p = data.data['estimated_amount'];

    return data;
  }

  Future accountState() async {
    var url = Uri.parse(AppUrl.accountState);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email3');
    http.Response response = await http.post(url, body: {'email': email});
    var data = jsonDecode(response.body);
    if ('$data' == '{status: Fake}') {
      return false;
    }
    if ('$data' == '{status: Success}') {
      return true;
    }
    if ('$data' == '{status: faildttttt}') {
      return null;
    }
  }

  Future getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();

    return user_id;
  }

  Future<bool> regster(String email, String pass, String name, String phone,
      String rootId) async {
    var url = Uri.parse(AppUrl.register);

    http.Response response = await http.post(url, body: {
      'email': email,
      'pass': pass,
      'name': name,
      'phone': phone,
      'root': rootId
    });
    // var data = jsonDecode(response.body);

    var resdata = jsonDecode(response.body);
    // UserPreferences().saveUser(User.fromJson(resdata['data']));

    if (resdata['state'] == true) {
      UserPreferences().saveRegesterdUser(true, email);

      return resdata;
    } else if (resdata['state'] == 'We are sorry email aredy exist') {
      UserPreferences()
          .saveRegesterdUser(false, "We are sorry email aredy exist");
      return resdata;
    } else {
      UserPreferences().saveRegesterdUser(false, "");
      return resdata;
    }
    // return resault;
    // if (data.toString() == 'false') {
    //   print("rong email");
    //   return data;
    // } else {
    //   return data;
    //   // print(data.toString());
    // }
  }

  Future<bool> updateAccount(String email, String name, String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    var url = Uri.parse(AppUrl.updateaccount);
    http.Response response = await http.post(url,
        body: {'Id': user_id, 'newemail': email, 'name': name, 'phone': phone});
    // var data = jsonDecode(response.body);

    var resdata = jsonDecode(response.body);

    return resdata;
  }

  Future<bool> withdraw(String address, String amount) async {
    var url = Uri.parse(AppUrl.withdraw);

    http.Response response =
        await http.post(url, body: {'address': address, 'amount': amount});
    // var data = jsonDecode(response.body);

    var resdata = jsonDecode(response.body);
    // UserPreferences().saveUser(User.fromJson(resdata['data']));

    // if () {

    //   return resdata;
    // } else {

    return resdata;
    // }
  }

  Future<bool> add_Miner(String hashRate, String price) async {
    var url = Uri.parse(AppUrl.add_miners);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url,
        body: {'Hash_Rate': hashRate, 'Price': price, 'User_Id': user_id});
    var resdata = jsonDecode(response.body);

    return resdata;
  }

  Future<bool> add_requ(String bitcoinaddress, String amount) async {
    var url = Uri.parse(AppUrl.add_requ);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString('Id').toString();
    http.Response response = await http.post(url, body: {
      'Address': bitcoinaddress,
      'Amount': amount,
      'User_Id': user_id
    });
    var resdata = jsonDecode(response.body);

    return resdata;
  }

  Future fogotfirststep(String email) async {
    var url = Uri.parse(AppUrl.forgotpassword);
    http.Response response = await http.post(url, body: {'email': email});
    var resdata = jsonDecode(response.body);
    return resdata;
  }

  Future restepassword(String email, String pass) async {
    var url = Uri.parse(AppUrl.restepassword);
    http.Response response =
        await http.post(url, body: {'email': email, 'pass': pass});
    var resdata = jsonDecode(response.body);
    return resdata;
  }

  Future emailValidation(String email) async {
    var url = Uri.parse(AppUrl.emailValidation);

    http.Response response = await http.post(url, body: {'email': email});
    // var data = jsonDecode(response.body);

    var resdata = jsonDecode(response.body);

    print(resdata);

    return resdata;
  }

  Future emailValidation2(String email, String code) async {
    var url = Uri.parse(AppUrl.emailValidation2);

    http.Response response =
        await http.post(url, body: {'email': email, 'code': code});
    var resdata = jsonDecode(response.body);
    if ('$resdata' == '{status: }') {
      return null;
    }
    if ('$resdata' == '{status: Success}') {
      return true;
    }
    if ('$resdata' == '{status: faildttttt}') {
      return false;
    }
  }
}
