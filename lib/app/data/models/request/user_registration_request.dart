class UserRegistrationRequest {
  UserRegistrationRequest({
    this.phoneNumber,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
  });

  UserRegistrationRequest.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }
  String? phoneNumber;
  String? password;
  String? firstName;
  String? lastName;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['password'] = password;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    return map;
  }
}
