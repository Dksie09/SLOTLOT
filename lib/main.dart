import 'package:flutter/material.dart';
import 'name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF000000),
        // appBar: AppBar(
        //   title: Text("SLOTLOT"),
        //   backgroundColor: Color(0xFF121212),
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/lot01.png'),
                // height: 500,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  // color: Colors.greenAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'SLOT LOT',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                      Text(
                        'Parking made swiftier',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                            fontFamily: 'Pacifico'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text(
                          'A parking experience like never before',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NameScreen(),
                            ),
                          );
                        },
                        child: Text(
                          ' Get Started  → ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        color: Colors.white,
                        textColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 10.0),
                        // minWidth: double.infinity,
                      )
                    ], //
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
