class UserToken {
  String? accessToken;

  UserToken({this.accessToken});

  UserToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = accessToken;
    return data;
  }
}
