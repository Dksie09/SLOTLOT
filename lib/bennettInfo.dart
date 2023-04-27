import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:async';

class BennettInfoPage extends StatefulWidget {
  @override
  _BennettInfoPageState createState() => _BennettInfoPageState();
}

class _BennettInfoPageState extends State<BennettInfoPage> {
  int availableBennettCount = 0;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _fetchAvailableBennettCount();
  }

  Future<void> _fetchAvailableBennettCount() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bennett')
        .where('available', isEqualTo: true)
        .get();
    setState(() {
      availableBennettCount = querySnapshot.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Info Page'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Bennett Parking Lot',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: Image(
                image: AssetImage("images/sunny_parking_lot.png"),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      Icon(Icons.star_half, color: Colors.yellow, size: 16),
                      SizedBox(width: 10),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Availability: Open',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Other Information: Even during the night, this parking is open for teachers and staff this is a 24/7 Parking Lot.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Available Slots: $availableBennettCount/5',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Slots Available',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )

            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.all(10.0),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(10.0),
            //       topRight: Radius.circular(10.0),
            //       bottomLeft: Radius.circular(10.0),
            //       bottomRight: Radius.circular(10.0),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
