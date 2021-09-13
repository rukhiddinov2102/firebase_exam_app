import 'package:examscreens/details/product_details.dart';
import 'package:examscreens/login/introduction_page.dart';
import 'package:examscreens/screens/acocunt_page.dart';
import 'package:examscreens/screens/cart_page.dart';
import 'package:examscreens/screens/favorite_page.dart';
import 'package:examscreens/screens/history_page.dart';
import 'package:examscreens/screens/homepage.dart';
import 'package:examscreens/utils/zoom_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Mainpage());
  }
}

class Mainpage extends StatefulWidget {
  Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(),
    );
  }
}
