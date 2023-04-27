import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';

class parkingLot extends StatefulWidget {
  // const parkingLot({Key? key}) : super(key: key);

  final String? uid;
  final String? carNumber;
  // final int count;

  parkingLot(this.uid, this.carNumber);

  @override
  State<parkingLot> createState() => _parkingLotState();
}

class _parkingLotState extends State<parkingLot> {
  String _uid = "";
  String? _carNumber = "";
  late int _count;

  DocumentSnapshot? AvailableSlot;
  String slotID = "Null";

  // Future<void> getCount() async {
  //   final FirebaseFirestore _db = await FirebaseFirestore.instance;
  //   // int count = 0;
  //   _db.collection('users').doc(_uid).snapshots().listen((docSnapshot) {
  //     if (docSnapshot.exists) {
  //       _count = docSnapshot.get('count');
  //       // _count = count;
  //       print("getCount1: $_count");
  //       if (_count == 1) {
  //         print("condition passed!");
  //         getAvailableSlot();
  //         updateCount();
  //       }
  //     }
  //   });
  // }

  Future<void> getAvailableSlot() async {
    print("Function called!");
    final snapshot = await FirebaseFirestore.instance
        .collection('bennett')
        .where('available', isEqualTo: true)
        .limit(1)
        .get();
    print(snapshot.docs.first);
    print(_carNumber);

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
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    _db.collection('users').doc(_uid).snapshots().listen((docSnapshot) async {
      if (docSnapshot.exists) {
        bool isPresent = docSnapshot.get('entry');
        if (isPresent) {
          documentReference.update({
            'assigned': _carNumber,
            'available': false,
          });
        } // else {
        //   documentReference.update({
        //     'assigned': 0,
        //     'available': true,
        //   });
        // }
      }

      // print("later count: $_count");
    });
    // _count++;
    // DocumentReference user =
    //     FirebaseFirestore.instance.collection('users').doc(_uid);
    //
    // // Update the 'count' field value to 2 for the specified document
    // await user.update({'count': _count});
    //
    // print('Count updated successfully for user $_uid as $_count');
  }

  // Future<void> updateCount() async {
  //   _count++;
  //   DocumentReference user =
  //       FirebaseFirestore.instance.collection('users').doc(_uid);
  //
  //   // Update the 'count' field value to 2 for the specified document
  //   await user.update({'count': _count});
  //
  //   print('Count updated successfully for user $_uid as $_count');
  // }

  @override
  void initState() {
    _uid = widget.uid ?? "0";
    _carNumber = widget.carNumber;
    super.initState();
    getAvailableSlot();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: Text(
                //     "Park at this spot  :",
                //     style: TextStyle(
                //         // fontFamily: "Pacifico",
                //         fontSize: 30,
                //         color: Colors.white),
                //   ),
                // ),
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.deepOrange,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 95, vertical: 8),
                    child: Text(
                      "Assigned: $slotID",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 30),
                Image(image: AssetImage('images/lots/$slotID.jpg')),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
