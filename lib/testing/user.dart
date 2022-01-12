class User {
  String? email;
  String? name;
  String? id;

  User({this.email, this.name, this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
