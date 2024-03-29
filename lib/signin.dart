import 'package:flutter/material.dart';
import 'homepage.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  String plate = "";
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
                              'Email                                                                ',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15)),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                            hintText: "PeterParker69@gmail.com",
                            hintStyle: TextStyle(
                                fontSize: 18.0, color: Colors.grey.shade900),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
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
                          onChanged: (value) {
                            plate = value;
                          },
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
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15),
                          ),
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
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        // Create a new user with the provided email and password
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);

                        // Send a verification email to the user
                        final user = FirebaseAuth.instance.currentUser;
                        await user?.sendEmailVerification();

                        // Show a dialog to prompt the user to verify their email
                        if (user != null && !user.emailVerified) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Verify'),
                              content: Text('Please verify your email'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, "OK"),
                                    child: const Text('OK')),
                              ],
                            ),
                          );
                        }

                        // Add the new user to the database
                        if (newUser != null) {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(newUser.user!
                                  .uid) // Use the user's unique ID as the document ID
                              .set({
                            'numberPlate': plate,
                            'email': email,
                            'entry': false,
                            'count': 0
                          });

                          // Navigate to the home page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Email already in use'),
                              content: Text(
                                  'The email address is already in use by another account.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
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
    // );
  }
}
