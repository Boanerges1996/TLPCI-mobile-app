import 'package:cached_network_image/cached_network_image.dart';
import 'package:church_app/src/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          profilePic(context),
          viewProfile(context),
          settings(context),
          aboutChurch(context),
          logout(context),
        ],
      ),
    );
  }

  Widget profilePic(context) {
    UserData myInfo = Provider.of<UserData>(context);
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Color(0xfae91e63)),
      accountEmail: Text(myInfo.getUserInfo["email"]),
      accountName: Text(myInfo.getUserInfo["username"]),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          // child: CachedNetworkImage(
          //   imageUrl:
          //       "https://avatars1.githubusercontent.com/u/43884482?s=460&u=28deefa0cac7c9c7fd0fffa70192d043e00a3f9f&v=4",
          // ),
          backgroundImage: NetworkImage(myInfo.getUserInfo["url"]),
        ),
      ),
    );
  }

  Widget viewProfile(context) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.user),
      title: Text("Profile"),
      onTap: () {
        Navigator.of(context).pushNamed("/profile/page");
      },
    );
  }

  Widget settings(context) {
    return ListTile(
      leading: Icon(Icons.settings),
      title: Text("Setting"),
      onTap: () {},
    );
  }

  Widget aboutChurch(context) {
    return ListTile(
      leading: Icon(Icons.account_balance),
      title: Text("About Church"),
      onTap: () {},
    );
  }

  Widget logout(context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            "logout",
            style: GoogleFonts.lato(fontSize: 20),
          ),
          onTap: () {
            logoutFunction();
          },
        ),
      ),
    );
  }

  void logoutFunction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.of(context).popAndPushNamed("/");
  }
}
