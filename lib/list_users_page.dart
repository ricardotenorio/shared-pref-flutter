import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_pref/user.dart';
import 'package:shared_pref/user_controller.dart';

class ListUsersPage extends StatelessWidget {
  UserController userController = UserController();

  late List<User> users = [];

  Widget build(BuildContext context) {
    _getUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Center(
              child: Text(
                'Nome: ${users[index].name}'
                'Idade: ${users[index].age}'
                'Endereço: ${users[index].address}'
              ),
            ),
          );
        },
      ),
    );
  }

  _getUsers() async {
    var futureUsers = await userController.read('users');

    for (var user in futureUsers) {
      users.add(
        User(
          name: user['name'],
          age: user['age'],
          address: user['address'],
        )
      );
    }

    print(users.toString());
  }
}