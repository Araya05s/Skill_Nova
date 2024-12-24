
import 'dart:convert';

Users usersFromMap(String str) => Users.fromMap(json.decode(str));

String usersToMap(Users data) => json.encode(data.toMap());

class Users {
  final int? usrId;
  final String? fullName;
  final String? email;
  final String usrName;
  final String password;
  final bool isAdmin;


  Users({
    this.usrId,
    this.fullName,
    this.email,
    required this.usrName,
    required this.password,
    required this.isAdmin,
  });


  Users copy({
    int? usrId,
    String? fullName,
    String? email,
    String? usrName,
    String? password,
    bool? isActive,
  }) => Users(
    usrId: usrId ?? this.usrId,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    usrName: usrName ?? this.usrName,
    password: password ?? this.password,
    isAdmin: isActive ?? this.isAdmin
  );

  //These json value must be same as your column name in database that we have already defined
  //one column didn't match
  factory Users.fromMap(Map<String, dynamic> json) => Users(
    usrId: json["usrId"],
    fullName: json["fullName"],
    email: json["email"],
    usrName: json["usrName"],
    password: json["usrPassword"],
    isAdmin: json["isActive"],
  );

  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "fullName": fullName,
    "email": email,
    "usrName": usrName,
    "usrPassword": password,
    "isActive": isAdmin
  };
}