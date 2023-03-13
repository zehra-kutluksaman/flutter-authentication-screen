class UserModel {
  String? username;
  String? phone;
  String? email;
  String? token;
  String? userId;

  UserModel({
    this.username,
    this.phone,
    this.email,
    this.token,
    this.userId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    phone = json["phone"];
    email = json["email"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["phone"] = phone;
    data["email"] = email;
    data["token"] = token;
    return data;
  }
}
