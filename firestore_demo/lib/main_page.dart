import 'package:cloud_firestore/cloud_firestore.dart';
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
          ListView(
            children: [
              // FutureBuilder <QuerySnapshot>(
              //   future: users.get(),
              //   builder: (context,snapshot){
              //     if(snapshot.connectionState == ConnectionState.waiting){
              //       return CircularProgressIndicator();
              //     }else if(!snapshot.hasData){
              //       return Text("Data Not Found");
              //     }else{
              //       return
              //     }
              //   }
              //   )
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    width: MediaQuery.of(context).size.width * .95,
                    height: 80,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Nama",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
