import 'package:church_app/src/provider/userProvider.dart';
import 'package:church_app/src/widgets/userpage/drawer.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/event.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/eventBuilder.dart';
import 'package:church_app/src/widgets/userpage/homepage/landing..dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var selectedNav = 0;
  @override
  Widget build(BuildContext context) {
    UserData myInfo = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TPCIG"),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(myInfo.getUserInfo["url"]),
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: UserDrawer(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.pink,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Event"), icon: Icon(FontAwesomeIcons.newspaper)),
            BottomNavigationBarItem(
                title: Text("Post"), icon: Icon(Icons.add_circle)),
            BottomNavigationBarItem(
                title: Text("settings"), icon: Icon(Icons.settings))
          ],
          onTap: (index) {
            setState(() {
              selectedNav = index;
            });
          },
          currentIndex: selectedNav,
        ),
      ),
      body: [AboutChurch(), Events(), Text("Post"), Text("Setting")]
          .elementAt(selectedNav),
    );
  }
}
