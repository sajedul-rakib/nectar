class UserModel {
  String? address;
  String? phoneNumber;
  String? profilePic;
  String? fullName;
  String? email;
  String? token;

  UserModel(
      {this.address,
      this.phoneNumber,
      this.profilePic,
      this.fullName,
      this.email,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    profilePic = json['profilePic'];
    fullName = json['fullName'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['profilePic'] = profilePic;
    data['fullName'] = fullName;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
