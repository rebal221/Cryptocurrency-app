class User {
  String Id;
  String Name;
  String Email;
  String Password;
  String Phone;
  String Type;
  String token;
  String renewalToken;

  User(
      {this.Id = " ",
      this.Name = " ",
      this.Email = " ",
      this.Password = " ",
      this.Type = " ",
      this.Phone = " ",
      this.token = " ",
      this.renewalToken = " "});

  // now create converter

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      Id: responseData['Id'],
      Name: responseData['Name'],
      Email: responseData['Email'],
      Password: responseData['Password'],
      Type: responseData['Type'],
      Phone: responseData['Phone'],
      token: responseData['token'].toString(),
      renewalToken: responseData['token'].toString(),
    );
  }
}
