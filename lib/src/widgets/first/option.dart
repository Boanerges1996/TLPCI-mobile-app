import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Option extends StatefulWidget {
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://www.tlpci.org/wp-content/uploads/thegem-logos/logo_71416a6685064720c8341d309af1db5f_2x.png",
          ),
          SizedBox(
            height: 70,
          ),
          loginBtn(context),
          SizedBox(
            height: 12,
          ),
          signupBtn(context),
        ],
      ),
    );
  }

  Widget loginBtn(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1.5,
      height: 50,
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          "Login",
          style: GoogleFonts.rubik(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/login");
        },
      ),
    );
  }

  Widget signupBtn(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width / 1.5,
      height: 50,
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          "Signup",
          style: GoogleFonts.rubik(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/signup");
        },
      ),
    );
  }
}
