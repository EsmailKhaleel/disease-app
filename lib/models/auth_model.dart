class AuthModel {
  String? authToken;
  String? refreshToken;

  AuthModel({this.authToken, this.refreshToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    authToken = json['authenticationToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticationToken'] = this.authToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
