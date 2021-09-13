import 'package:examscreens/constant/colors.dart';
import 'package:examscreens/constant/custom_text.dart';
import 'package:examscreens/details/product_details.dart';
import 'package:examscreens/login/login_page.dart';
import 'package:flutter/material.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sunset_orange,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 75,
                    height: 75,
                    child: Image.asset("assets/Images/shapka.jpg",scale: 6,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppText(
                  size: 60,
                  color: Colors.white,
                  text: "CALEB G\nRestuarant",
                  weight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/Images/toyface_right.png",
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/Images/toyface_left.png",
              height: MediaQuery.of(context).size.height * 0.55,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[vermilion_10, vermilion_100],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: AppButton(
              text: "Get Started",
              backgraoundColors: Colors.white,
              textColor: vermilion,
              borderRadiuss: 30,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
} 