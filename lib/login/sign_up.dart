import 'package:examscreens/constant/colors.dart';
import 'package:examscreens/constant/custom_text.dart';
import 'package:examscreens/login/custom_input.dart';
import 'package:examscreens/utils/zoom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class SignUpInputScreen extends StatefulWidget {
  @override
  _SignUpInputScreenState createState() => _SignUpInputScreenState();
}

class _SignUpInputScreenState extends State<SignUpInputScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "umid@gmail.com",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (e) {
                  if (e!.isEmpty) {
                    return "email ni kiriting";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (pass) {
                  if (pass!.length < 6) {
                    return "kamida 6 ta belgi kiritishingiz kerak";
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Forgot Passcode",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    _emailSignUp();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  }
                },
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    fixedSize: Size(314, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _emailSignUp() async {
    // if (formkey.currentState!.validate()) {
    //   formkey.currentState!.save();
    try {
      UserCredential _credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      User _newuser = _credential.user!;
      await _newuser.sendEmailVerification();
      if (_firebaseAuth.currentUser != null) {
        await _firebaseAuth.signOut();
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) {
          return Zooom();
        }));
        print("user sign out boldi");
      }
      print(_newuser.email);
    } catch (e) {}
  }
}
