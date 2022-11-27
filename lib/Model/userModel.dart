class UserModel {
  int? id;
  String? name;
  String? userId;
  String? password;

  UserModel({this.id, this.name, this.userId, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['password'] = this.password;
    return data;
  }
}
