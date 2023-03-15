import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            'https://images.pexels.com/photos/3109671/pexels-photo-3109671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ),
    );
  }
}
