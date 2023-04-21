class UserModel {
  String? email;
  String? accessToken;

  UserModel({this.email, this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['accessToken'] = accessToken;
    return data;
  }
}