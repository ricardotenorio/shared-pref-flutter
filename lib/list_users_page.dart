import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_pref/user.dart';
import 'package:shared_pref/user_controller.dart';

class ListUsersPage extends StatelessWidget {
  final UserController userController = UserController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
      ),
      body: FutureBuilder<List> (
        future: userController.read('users'),
        builder: (context, usersSnapshot) {
          if (usersSnapshot.hasError || !usersSnapshot.hasData) {
            return const Text('Erro');
          }
          return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: usersSnapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Nome: ${usersSnapshot.data![index]['name']}'
                      ' Idade: ${usersSnapshot.data![index]['age']}'
                      ' Endereço: ${usersSnapshot.data![index]['address']}'
                    ),
                  ),
                );
              },
          );
        },
      ),
    );
  }
}