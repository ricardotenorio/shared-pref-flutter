import 'dart:convert';

class User {

    final String name, age, address;

    User({required this.name, required this.age, required this.address});

    factory User.fromJson(Map<String, dynamic> json) {
      return User(
        name: json['name'],
        age: json['age'],
        address: json['address']
      );
    }

    static Map<String, dynamic> toMap(User user) =>
      {
        'name': user.name,
        'age': user.age,
        'address': user.address
      };

}