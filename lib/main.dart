import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFF000000),
          appBar: AppBar(
            title: Text("SLOTLOT"),
            backgroundColor: Color(0xFF121212),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Image(
                  image: AssetImage('images/lot01.png'),
                ),
                Container(
                  height: 200,
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'SLOT LOT',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Parking made swiftier',
                        style: TextStyle(color: Colors.white70, fontSize: 25),
                      ),
                      Text('Experience effortless parking like never before',
                          style: TextStyle(color: Colors.white70))
                    ], //
                  ),
                )
              ],
            ),
          )),
    ),
  );
}
