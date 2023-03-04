import 'package:flutter/material.dart';
import 'homepage.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF000000),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/girl.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Colors.white70),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: 30,
                  width: 80,
                  child: Divider(
                    color: Colors.white70,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: 300,
                  // height: 50,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                            'Enter name                                                  ',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15)),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.7),
                          ),
                          hintText: "Peter Parker",
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Colors.grey.shade900),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 300,
                  // height: 50,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                            'Enter number plate                                      ',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15)),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.7),
                          ),
                          hintText: "PB-10-BY-0001",
                          hintStyle: TextStyle(
                              fontSize: 16.0, color: Colors.grey.shade900),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    ' SIGN IN ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                  // minWidth: double.infinity,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
