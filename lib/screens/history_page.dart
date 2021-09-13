import 'package:examscreens/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "History",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.asset(
              "assets/Images/list.png",
              scale: 4,
              color: Color.fromRGBO(199, 199, 199, 1),
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              "No history yet",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 18,
            ),
            Text("Hit the orange button down\nbelow to Create an order"),
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
                fixedSize: Size(314, 70),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                "Start ordering",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
