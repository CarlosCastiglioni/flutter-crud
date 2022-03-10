class User {
  String? id;
  String? cpf;
  String name = "";
  String? email;
  String? password;
  List<String>? profiles;

  User(
      {this.id,
      this.cpf,
      required this.name,
      this.email,
      this.password,
      this.profiles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpf = json['cpf'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    profiles = json['profiles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profiles'] = this.profiles;
    return data;
  }
}
