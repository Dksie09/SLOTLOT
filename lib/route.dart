import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';

class parkingLot extends StatefulWidget {
  const parkingLot({Key? key}) : super(key: key);

  @override
  State<parkingLot> createState() => _parkingLotState();
}

class _parkingLotState extends State<parkingLot> {
  DocumentSnapshot? AvailableSlot;
  String slotID = "Null";
  Future<void> getAvailableSlot() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('bennett')
        .where('available', isEqualTo: true)
        .limit(1)
        .get();
    print(snapshot.docs.first);

    if (snapshot.docs.isNotEmpty) {
      setState(() {
        AvailableSlot = snapshot.docs.first;
      });
    }
    final documentId = AvailableSlot!.id;
    slotID = documentId;
    print(slotID);
    final documentReference =
        FirebaseFirestore.instance.collection('bennett').doc(documentId);
//------------

    //-------------
    await documentReference.update({
      //   'assigned': ,
      'available': false,
      //   // Add more fields to update here
    });
    // print("done");
  }

  @override
  void initState() {
    super.initState();
    getAvailableSlot();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  "You have been assigned:",
                  style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              // SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orangeAccent,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Text(
                  "$slotID",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              // SizedBox(height: 30),
              Image(image: AssetImage('images/lots/$slotID.png')),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
