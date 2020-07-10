import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgottenPassword extends StatefulWidget {
  @override
  _ForgottenPasswordState createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff4a148c),
              const Color(0xfae91e63),
            ],
            begin: Alignment.centerLeft,
            end: Alignment(
              -1.0,
              -1.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Reset Password",
              style: GoogleFonts.merriweatherSans(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            email(context),
            SizedBox(
              height: 10,
            ),
            reset(context)
          ],
        ),
      ),
    );
  }

  Widget email(context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "example@123.com",
        labelText: "email",
        labelStyle: TextStyle(
          color: Color(0xff4a148c),
        ),
      ),
    );
  }

  Widget reset(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        color: const Color(0xfae91e63),
        child: Text(
          "Submit",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
        onPressed: () {
          Navigator.of(context).popAndPushNamed('/login');
        },
      ),
    );
  }
}
