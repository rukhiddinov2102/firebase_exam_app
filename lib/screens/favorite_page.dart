import 'package:examscreens/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZoomDrawerController? _zoomDrawerController;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Orders",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Image.asset(
              "assets/Images/cart.png",
              scale: 4,
              color: Color.fromRGBO(199, 199, 199, 1),
            ),
            SizedBox(
              height: 38,
            ),
            Text(
              "No orders yet",
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
