class UserDataModel {
  late String firstName;
  late String lastName;
  late String email;
  late String? gender;

  UserDataModel(this.firstName, this.lastName, this.email, this.gender);

  UserDataModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    return data;
  }
}
