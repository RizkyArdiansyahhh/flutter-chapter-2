class User {
  final String? id;
  final String name;
  final int age;

  const User({this.id, required this.name, required this.age});

  factory User.fromJson(String id, Map<String, dynamic> dataJson) {
    return User(id: id, name: dataJson["name"], age: dataJson["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "age": age};
  }
}
