class UserRegistrationResponse {
  UserRegistrationResponse({
    this.userData,
    this.token,
  });

  UserRegistrationResponse.fromJson(dynamic json) {
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    token = json['token'];
  }
  UserData? userData;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userData != null) {
      map['user_data'] = userData!.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class UserData {
  UserData({
    this.phoneNumber,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
  });

  UserData.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'].toString();
  }
  String? phoneNumber;
  dynamic username;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['username'] = username;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['country_code'] = countryCode;
    return map;
  }
}
