import 'package:church_app/src/provider/userProvider.dart';
import 'package:church_app/src/widgets/first/one.dart';
import 'package:church_app/src/widgets/first/option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changePage();
  }

  void changePage() async {
    Duration time = await Future.delayed(new Duration(seconds: 3));
    setState(() {
      isLoaded = false;
    });
  }

  void checkLogged(context) async {
    UserData myInfo = Provider.of<UserData>(context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool("logged") == true) {
      String name = pref.getString("name");
      String email = pref.getString("email");
      String url = pref.getString("url");
      String _id = pref.getString("_id");
      String username = pref.getString("username");
      bool isPastor = pref.getBool("isPastor");
      Map info = {
        "name": name,
        "email": email,
        "_id": _id,
        "url": url,
        "isPastor": isPastor,
        "logged": true,
        "username": username
      };
      myInfo.setInfo(info);
      Navigator.of(context).pushNamed("/userpage");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded == true) {
      checkLogged(context);
      return One();
    }
    return Option();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Yh"),
    //   ),
    // );
  }
}
