import 'package:flutter/material.dart';

class CrashedPage extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0.0),
                  child: Text('Under construction',
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage('images/crashed_car.png'),
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consectetur tempus lorem, vel facilisis eros congue vel. Integer elementum, tellus ut viverra condimentum, purus erat tempus nibh, at tempor nisi turpis ut tortor. Nam mauris turpis, porttitor eu velit nec, iaculis pulvinar nulla. Mauris pulvinar purus non lacus ultricies, sed maximus dui interdum. Morbi eget nunc ipsum. Suspendisse ut diam arcu. Vivamus ac ultrices augue. Mauris fermentum facilisis volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras placerat sapien diam, sit amet dapibus est lacinia a. Duis ac nulla eget nisi mollis tincidunt vel eu felis. Aliquam quis velit volutpat, ultricies nunc non, volutpat libero.',
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
