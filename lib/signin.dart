import 'package:flutter/material.dart';
import 'homepage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF000000),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/snowy.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Sign in',
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
                              'Username                                                       ',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15)),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.7),
                            ),
                            // prefixIcon: Icon(Icons.account_circle,
                            //     color: Colors.grey.shade900),
                            hintText: "PeterParker69",
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
                              'Number plate                                                 ',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15)),
                        ),
                        TextFormField(
                          // keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.7),
                            ),
                            // prefixIcon: Icon(Icons.car_rental,
                            //     color: Colors.grey.shade900),
                            hintText: "AX 10 BY 0001",
                            // labelText: 'Number Plate',
                            hintStyle: TextStyle(
                                fontSize: 16.0, color: Colors.grey.shade900),
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
                              'Password                                                    ',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15)),
                        ),
                        TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.7),
                            ),
                            // prefixIcon:
                            //     Icon(Icons.key, color: Colors.grey.shade900),
                            // hintStyle: TextStyle(
                            //     fontSize: 16.0, color: Colors.grey.shade900),
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
          ),
        )),
      ),
    );
  }
}
