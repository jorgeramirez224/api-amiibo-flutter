class UserModel {
  int? id;
  String? name;
  String? userName;
  String? email;

  UserModel({this.id, this.name, this.userName, this.email});

  factory UserModel.fromJsonMap(Map<String, dynamic> json){
    return UserModel(
      id: json['id'], 
      name: json['name'], 
      userName: json['userName'], 
      email: json['email']
      );
  }
}
