import 'package:examscreens/utils/zoom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth? _firebaseAuth = FirebaseAuth.instance;

class LoginInputScreen extends StatefulWidget {
  @override
  _LoginInputScreenState createState() => _LoginInputScreenState();
}

class _LoginInputScreenState extends State<LoginInputScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 24),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  _emailSignIn();
                }
              },
              child: Text("Log in"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  fixedSize: Size(314, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            )
          ]),
        ),
      ),
    );
  }

  _emailSignIn() async {
    try {
      if (formkey.currentState!.validate()) {
        formkey.currentState!.save();
        FocusScope.of(context).unfocus();
        User _signInQilganUser = (await _firebaseAuth!
                .signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text))
            .user!;

        print("User tizimga kirdi: ${_signInQilganUser.email}");
        if (_signInQilganUser.emailVerified) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return Zooom();
          }));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Emailingizni tasdiqlab qaytadan urinib ko'ring")));
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Email yoki parol notogri")));
    }
  }
}
