class UserRegistrationRequest {
  UserRegistrationRequest({
    this.phoneNumber,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.countrycode,
  });

  UserRegistrationRequest.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countrycode = json['country_code'];
  }
  String? phoneNumber;
  String? password;
  String? firstName;
  String? lastName;
  String? email;
  String? countrycode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['password'] = password;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['country_code'] = countrycode;
    return map;
  }
}
