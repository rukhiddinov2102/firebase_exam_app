
import 'package:examscreens/constant/colors.dart';
import 'package:examscreens/login/login_input.dart';
import 'package:examscreens/login/sign_up.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF1F1F1),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: TabBarView(
                          children: [LoginInputScreen(), SignUpInputScreen()]),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 4), color: Colors.white,spreadRadius: 3,)
                      
                    ],
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/Images/shapka.jpg",
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TabBar(
                          tabs: [
                            Tab(
                              text: "Login",
                            ),
                            Tab(
                              text: "Sign-Up",
                            )
                          ],
                          labelColor: Colors.black,
                          indicatorColor: vermilion,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}