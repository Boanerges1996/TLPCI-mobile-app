import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class AboutChurch extends StatefulWidget {
  @override
  _AboutChurchState createState() => _AboutChurchState();
}

class _AboutChurchState extends State<AboutChurch> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "The Lord's Pentecostal Church International",
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            churchLogo(context),
            generalMessage(context),
          ],
        ),
      ),
    );
  }

  Widget churchLogo(context) {
    return Container(
      child: Image.network(
        "https://www.tlpci.org/wp-content/uploads/thegem-logos/logo_71416a6685064720c8341d309af1db5f_2x.png",
      ),
    );
  }

  Widget generalMessage(context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(),
            child: CachedNetworkImage(
              imageUrl:
                  "https://www.tlpci.org/wp-content/uploads/2020/02/Apostle-Otoo.png",
              fadeInDuration: Duration(seconds: 2),
            ),
          ),
          ButtonTheme(
            child: FlatButton(
              child: Text(
                "APOSTLE ERIC OTOO (G.O)",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              color: Color(0xff4a148c),
              onPressed: () {},
            ),
            minWidth: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "YOU ARE WELCOME",
              style: GoogleFonts.robotoMono(
                fontSize: 40,
                color: Color(0xff4a148c),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 5,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              """
We serve a living God who watches over his word to perform. No matter what your situation or battles in life, the word of God has the solution.                           

At The Lord’s Pentecostal Church International, it is our vision to be a place where the hurting, the depressed, the frustrated and the confused can find peace, love, acceptance, help, hope, forgiveness and encouragement.

Worship with us in any of our branches across the nation and outside of Ghana. God richly bless you and make you fruitful in every area of your life.   

See you soon!!!
          """,
              textAlign: TextAlign.left,
              style: GoogleFonts.playfairDisplay(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "OUR PURPOSE STATEMENT",
              style: GoogleFonts.robotoMono(
                fontSize: 40,
                color: Color(0xff4a148c),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              """
TO BRING PEOPLE TO KNOW JESUS CHRIST AND JOIN HIS FAMILY, TO BUILD THEM TO CHRISTLIKE MATURITY AND EQUIP THEM THROUGH THE HOLY SPIRIT FOR MINISTRY IN THE CHURCH AND THE WORLD TO THE GLORY OF GOD.
          """,
              textAlign: TextAlign.left,
              style: GoogleFonts.playfairDisplay(
                fontSize: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
