import 'package:flutter/material.dart';
import 'crashed.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  //const ({Key? key}) : super(key: key);
  // int x = 0;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = Random();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: x == 0
              ? Text(
                  'Your position is $x th',
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  'Fuck you',
                  style: TextStyle(color: Colors.white),
                ),
          actions: [
            IconButton(
              onPressed: () {
                x = random.nextInt(10);
                setState(() {});
                print(x);
              },
              icon: Icon(
                Icons.list,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
          backgroundColor: Colors.black38,
        ),
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
                                        builder: (context) => CrashedPage()),
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
                                            // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10);],
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                alignment:
                                                    FractionalOffset.topCenter,
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
                                        style: TextStyle(color: Colors.white70),
                                      )
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
                                        builder: (context) => CrashedPage()),
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
                                                alignment:
                                                    FractionalOffset.topCenter,
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
                                        style: TextStyle(color: Colors.white70),
                                      )
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
    );
  }
}
