class UserModel {
  String username = "", email = "", password = "";

  UserModel(
      {required this.username, required this.email, required this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();

    data["id"] = this.username;
    data["name"] = this.email;
    data["image"] = this.password;
    return data;
  }
}
