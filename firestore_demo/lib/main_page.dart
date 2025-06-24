import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_demo/bloc/user_bloc.dart';
import 'package:firestore_demo/models/user.dart';
import 'package:firestore_demo/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUserEvent());
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CRUD with Cloud Firestore",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[300],
      ),
      body: Stack(
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                log(state.toString());
                return Center(child: const CircularProgressIndicator());
              } else if (state is UserValue) {
                log(state.toString());
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final User user = state.users[index];
                    return CardWidget(name: user.name, age: user.age);
                  },
                );
              } else if (state is UserError) {
                return Center(child: Text(state.message));
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-5, 0),
                    blurRadius: 15,
                    spreadRadius: 3,
                  ),
                ],
              ),
              width: double.infinity,
              height: 150,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(hintText: "Name"),
                          controller: nameController,
                        ),
                        TextField(
                          decoration: const InputDecoration(hintText: "Age"),
                          controller: ageController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<UserBloc>().add(
                            AddUserEvent(
                              name: nameController.text,
                              age: int.parse(ageController.text),
                            ),
                          );
                          context.read<UserBloc>().add(FetchUserEvent());
                          nameController.text = "";
                          ageController.text = "";
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.pink[300],
                        ),
                        child: Text(
                          "add data",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
