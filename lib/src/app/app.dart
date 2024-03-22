import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// * Import the router.dart file.
import '/src/app/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // * Set the orientation of the app
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data as Widget;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: RouterSystem.routes(),
    );
  }
}
