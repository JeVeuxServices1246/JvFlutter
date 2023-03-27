class UserLoginRequest {
  UserLoginRequest({
    this.phone,
    this.password,
  });

  UserLoginRequest.fromJson(dynamic json) {
    phone = json['phone_number'];
    password = json['password'];
  }
  String? phone;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phone;
    map['password'] = password;
    return map;
  }
}
