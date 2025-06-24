import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_demo/widget/card.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final CollectionReference users = FirebaseFirestore.instance.collection(
    "users",
  );

  MainPage({super.key});

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
          // ListView(
          //   children: [
          //     FutureBuilder<QuerySnapshot>(
          //       future: users.get(),
          //       builder: (context, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return CircularProgressIndicator();
          //         } else if (!snapshot.hasData) {
          //           return Text("Data Not Found");
          //         } else {
          //           return Column(
          //             children: snapshot.data!.docs.map((e) {
          //               final data = e.data() as Map<String, dynamic>;
          //               return CardWidget(name: data["name"], age: data["age"]);
          //             }).toList(),
          //           );
          //         }
          //       },
          //     ),
          //   ],
          // ),
          // FutureBuilder<QuerySnapshot>(
          //   future: users.get(),
          //   builder: (_, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: const CircularProgressIndicator());
          //     } else if (!snapshot.hasData) {
          //       return Center(child: Text("Data Not Found"));
          //     } else {
          //       return ListView.builder(
          //         itemCount: snapshot.data!.docs.length,
          //         itemBuilder: (context, index) {
          //           final doc = snapshot.data!.docs[index];
          //           final Map<String, dynamic> data =
          //               doc.data() as Map<String, dynamic>;
          //           return CardWidget(name: data["name"], age: data["age"]);
          //         },
          //       );
          //     }
          //   },
          // ),
          StreamBuilder<QuerySnapshot>(
            stream: users.snapshots(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              } else if (!snapshot.hasData) {
                return Center(child: Text("Data Not Found"));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data!.docs[index];
                    final Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    return CardWidget(name: data["name"], age: data["age"]);
                  },
                );
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
                          users.add({
                            "name": nameController.text,
                            "age": int.tryParse(ageController.text) ?? 0,
                          });
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
