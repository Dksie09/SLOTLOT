import 'package:flutter/material.dart';
import 'package:trial_all/dlfInfo.dart';
import 'crashed.dart';
import 'route.dart';
import 'dart:math';
import 'main.dart';
import 'bennettInfo.dart';
import 'dlfInfo.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  //const ({Key? key}) : super(key: key);
  // int x = 0;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late int count;
  // List<String> parkingLots = ['bennett university', 'dlf centeral parking'];
  // TextEditingController searchController = TextEditingController();

  User? loggedInUser;
  late String carNumber = "";
  late String? userID = "";
  late bool isPresent = false;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);

        final String uid = user.uid;
        final DocumentSnapshot snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        final Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;
        final String newCarNumber = data['numberPlate'];
        print(newCarNumber);
        setState(() {
          carNumber = newCarNumber;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void setupPresenceListener() async {
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    final user = await _auth.currentUser;
    loggedInUser = user;
    print(loggedInUser?.email);

    final String? uid = user?.uid;
    setState(() {
      userID = uid;
    });
    _db.collection('users').doc(uid).snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        isPresent = docSnapshot.get('entry');
        count = docSnapshot.get('count');
        print(isPresent);

        if (isPresent) {
          if (count == 0) {
            count++;
            // DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
            // FirebaseFirestore firestore = FirebaseFirestore.instance;
            // DocumentReference documentReference =
            //     firestore.collection('users').doc('uid');
            // print(uid);
            // documentReference.get().then((doc) {
            //   if (doc.exists) {
            //     documentReference.update({
            //       'count': count,
            //     });
            //   } else {
            //     print('Document does not exist!');
            //   }
            // });
            print("Hi! im homepage count $count");

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Attention'),
                content: Text('Your entry has been detected'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Not me!'),
                    child: const Text('Not me!'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Approve');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                parkingLot(userID, carNumber)),
                      );
                    },
                    child: const Text('Approve'),
                  ),
                ],
              ),
            );
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    setupPresenceListener();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('HOME'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.directions_car_filled),
                onPressed: () {
                  if (isPresent) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => parkingLot(userID, carNumber)),
                    );
                  }
                },
              ),
            ],
            backgroundColor: Colors.black38,
          ),
          drawer: Drawer(
              backgroundColor: Colors.black87,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.white24),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('images/crashed2.png'),
                      // radius: 50,
                    ),
                    accountName: Text(
                      loggedInUser?.email ?? '',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(
                      carNumber,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Colors.white70,
                    ),
                    title: Text(
                      'Bookings',
                      style: TextStyle(
                          color: Colors.white70,
                          // fontFamily: 'Source Sans Pro',
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.white70,
                    ),
                    title: Text(
                      'History',
                      style: TextStyle(
                          color: Colors.white70,
                          // fontFamily: 'Source Sans Pro',
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white70,
                    ),
                    onTap: () {
                      _auth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, '/main', (route) => false);
                      // print(Navigator.of(context).toString());
                    },
                    title: Text(
                      'Log out',
                      style: TextStyle(
                          color: Colors.white70,
                          // fontFamily: 'Source Sans Pro',
                          fontSize: 20),
                    ),
                  ),
                  // Text(
                  //   'Bookings',
                  //   style: TextStyle(
                  //       color: Colors.white70, fontFamily: 'Source Sans Pro'),
                  // ),
                  // Text(
                  //   'Profile',
                  //   style: TextStyle(
                  //       color: Colors.white70, fontFamily: 'Source Sans Pro'),
                  // ),
                  // Text(
                  //   'Log Out',
                  //   style: TextStyle(
                  //       color: Colors.white70, fontFamily: 'Source Sans Pro'),
                  // ),
                ],
              )),
          backgroundColor: Color(0xFF000000),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 8), // Add some content to the Expanded widget
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.black38,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'LexendDeca',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search for parking lot nearby",
                                ),
                              ),
                            ),
                            SizedBox(
                              width:
                                  7, // Add some content to the end of the Row widget
                            ),
                            //inserting cards
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 570,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                margin: EdgeInsets.all(8),
                                color: Color(0xFF222222),
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BennettInfoPage()),
                                    );
                                    // MapsLauncher.launchQuery(
                                    //     'Plot Nos 8-11, TechZone 2, Greater Noida, Uttar Pradesh 201310');
                                    // ;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        // width: 420,
                                        // height: 300,
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 344,
                                          height: 250,
                                          child: AspectRatio(
                                            aspectRatio: 487 / 451,
                                            child: Container(
                                              // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10);],
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  alignment: FractionalOffset
                                                      .topCenter,
                                                  image: AssetImage(
                                                      'images/sunny_parking_lot.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Bennett Parking',
                                          style: TextStyle(
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Even during the night, this parking is open for teachers and staff this is a 24/7 Parking Lot.',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              MapsLauncher.launchQuery(
                                                  'Plot Nos 8-11, TechZone 2, Greater Noida, Uttar Pradesh 201310');
                                              ;
                                            },
                                            child: RichText(
                                              text: TextSpan(
                                                // style: Theme.of(context).textTheme.body1,
                                                children: [
                                                  TextSpan(
                                                      text: '',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueGrey)),
                                                  WidgetSpan(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 2.0,
                                                      ),
                                                      child: Icon(
                                                        Icons.navigation,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                  ),
                                                  // TextSpan(text: 'By Michael'),
                                                ],
                                              ),
                                            )),
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(8),
                                color: Color(0xFF222222),
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => dlfInfoPage()),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                        // width: 420,
                                        // height: 300,
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 344,
                                          height: 250,
                                          child: AspectRatio(
                                            aspectRatio: 487 / 451,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  alignment: FractionalOffset
                                                      .topCenter,
                                                  image: AssetImage(
                                                      'images/night_parking_lot.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'DLF Central Parking',
                                          style: TextStyle(
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'This parking is free for 2 hours and chargeble after 2 hours and its free if you have a bill.',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              MapsLauncher.launchQuery(
                                                  'Plot No – M, 03, Sector 18, Noida, Uttar Pradesh 201301');
                                              ;
                                            },
                                            child: RichText(
                                              text: TextSpan(
                                                // style: Theme.of(context).textTheme.body1,
                                                children: [
                                                  TextSpan(
                                                      text: '',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueGrey)),
                                                  WidgetSpan(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 2.0,
                                                      ),
                                                      child: Icon(
                                                        Icons.navigation,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                  ),
                                                  // TextSpan(text: 'By Michael'),
                                                ],
                                              ),
                                            )),
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
