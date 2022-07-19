
class AuthModel {
  String? authToken;
  String? password;
  String? email;
  String? status;
  String? error;

  AuthModel({this.authToken, this.password, this.email, this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    authToken = json['authenticationToken'];
    password = json['password'];
    email = json['email'];
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authenticationToken'] = this.authToken;
    data['password'] = this.password;
    data['email'] = this.email;
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}

