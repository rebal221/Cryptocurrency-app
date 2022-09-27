import 'package:mining_sett/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('Id', user.Id);
    prefs.setString('Name', user.Name);
    prefs.setString('Email', user.Email);
    prefs.setString('Type', user.Type);
    prefs.setString('Phone', user.Phone);
    prefs.setString('token', user.token);

    return prefs.commit();
  }

  Future<bool> saveRegesterdUser(bool reg, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('regester', reg);
    prefs.setString('email2', email);

    return prefs.commit();
  }

  Future<bool> saveforgotUser(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email3', email);

    return prefs.commit();
  }

  Future<bool> saveemailUser(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('email2', email);

    return prefs.commit();
  }

  Future<bool> removeRegesterdUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('regester', false);
    prefs.setString('email2', '');

    return prefs.commit();
  }

  Future<bool> savetypeurl(String type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('urltype', type);

    return prefs.commit();
  }

  Future<bool> saveuserid(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('id', id);

    return prefs.commit();
  }

  // Future<bool?> getRegesterStatus() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? token = prefs.getBool("regester");
  //   return token;
  // }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var Id = prefs.getString("Id");
    var Name = prefs.getString("Name");
    var Email = prefs.getString("Email");
    var Type = prefs.getString("Type");
    var Phone = prefs.getString("Phone");
    var token = prefs.getString("token");
    var renewalToken = prefs.getString("renewalToken");
    return User(
        Id: Id == null ? " " : Id,
        Name: Name == null ? " " : Name,
        Email: Email == null ? " " : Email,
        Type: Type == null ? " " : Type,
        Phone: Phone == null ? " " : Phone,
        token: token == null ? " " : token,
        renewalToken: renewalToken == null ? " " : renewalToken);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('Id');
    prefs.remove('Name');
    prefs.remove('Email');
    prefs.remove('Phone');
    prefs.remove('Type');
    prefs.remove('token');
  }

  void removeEmail2() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('email2');
  }

  void removeEmail3() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('email3');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token == null ? "" : token;
  }

  Future<String> gettypeurl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("urltype");
    return token == null ? "" : token;
  }

  Future<bool> getloginsetion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("email3");
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
