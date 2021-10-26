import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_pref/list_users_page.dart';
import 'package:shared_pref/user.dart';
import 'package:shared_pref/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = UserController();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<Map<String, dynamic>> users = [];

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Usuário'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Nome',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Idade',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Endereço',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, MediaQuery.of(context).size.height / 2, 8, 10),
                child:
                  ElevatedButton(
                    onPressed: () => _registerUser(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      minimumSize: const Size.fromHeight(50)
                    ),
                    child: const Text('Cadastrar'),
                  )
              ),
              ElevatedButton(
                onPressed: () => Get.to(ListUsersPage()),
                style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      minimumSize: const Size.fromHeight(50)
                ),
                child: const Text('Exibir Usuários'),
              )
            ],
          ),
        ),
    );
  }

  void _registerUser(context) {
    users.add
      (
        User.toMap
          (
            User
              (
                name: nameController.text, 
                age: ageController.text, 
                address: addressController.text
              )
          )
      );
      userController.add('users', jsonEncode(users));
  }
}