import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:tugas_pts/ListTeams.dart';
import 'register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final greenColor = Color.fromARGB(255, 1, 186, 118);
  final greyColor = Color.fromARGB(255, 232, 232, 232);
  final TextEditingController modelEmail = TextEditingController();
  final TextEditingController modelPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Icon(
                Icons.account_circle_outlined,
                color: greyColor,
                size: 150,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text('Sign to continue',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 205, 205, 205))),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                    controller: modelEmail,
                    style: TextStyle(color: greenColor),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black54),
                        labelText: 'EMAIL',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: greenColor,
                        )))),
            Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                    controller: modelPassword,
                    style: TextStyle(color: greenColor),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                      labelText: 'PASSWORD',
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: greenColor,
                      ),
                    ))),
            Container(
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              width: double.infinity,
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.right,
                style: const TextStyle(color: Color.fromARGB(255, 1, 186, 118)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: ElevatedButton(
                  child: const Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: greenColor,
                      minimumSize: const Size.fromHeight(50),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListTeams()));
                  }),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text('create a new account',
                        style: TextStyle(color: greenColor)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onLogin() {
    if (modelEmail == "admin" && modelPassword == "admin") {
      AlertDialog alert = AlertDialog(
        title: Text("Login Berhasil"),
        content: Container(
          child: Text("Selamat Anda Berhasil login"),
        ),
        actions: [
          TextButton(
            child: Text('Ok'),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListTeams())),
          ),
        ],
      );
    }
  }
}
