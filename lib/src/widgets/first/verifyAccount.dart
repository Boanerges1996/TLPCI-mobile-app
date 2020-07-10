import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://www.tlpci.org/wp-content/uploads/thegem-logos/logo_71416a6685064720c8341d309af1db5f_2x.png",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Thanks on registering an account on TLPCI app, please check your email account to verify your account with us",
            style: GoogleFonts.acme(
              fontSize: 28,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
