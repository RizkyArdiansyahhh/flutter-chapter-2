class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});

  factory User.fromJson(Map<String, dynamic> dataJson) {
    return User(name: dataJson["name"], age: dataJson["age"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "age": age};
  }
}
