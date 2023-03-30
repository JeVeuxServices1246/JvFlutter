//TODO need to change
class User {
  User({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.userEmail,
    this.isUserLogin,
    this.authType,
    this.profilePicPath,
    this.isProvider,
    this.phoneNumber,
    this.token,
    this.countryCode,
  });

  User.fromJson(dynamic json) {
    userId = json['userId'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userEmail = json['userEmail'];
    isUserLogin = json['isUserLogin'];
    authType = json['auth_type'];
    profilePicPath = json['profilePicPath'];
    phoneNumber = json['phoneNumber'];
    isProvider = json['isProvider'];
    token = json['token'];
    countryCode = json['countryCode'];
  }

  String? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? token;
  String? userEmail;
  String? countryCode;
  bool? isUserLogin;
  dynamic authType;
  dynamic profilePicPath;
  String? phoneNumber;
  bool? isProvider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['userName'] = userName;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['userEmail'] = userEmail;
    map['isUserLogin'] = isUserLogin;
    map['auth_type'] = authType;
    map['profilePicPath'] = profilePicPath;
    map['phoneNumber'] = phoneNumber;
    map['isProvider'] = isProvider;
    map['token'] = token;
    map['countryCode'] = countryCode;
    return map;
  }
}
