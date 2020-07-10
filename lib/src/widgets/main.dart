import 'package:church_app/src/provider/allEventsProvider.dart';
import 'package:church_app/src/provider/selectedEvent.dart';
import 'package:church_app/src/provider/userProvider.dart';
import 'package:church_app/src/router/router.dart';
import 'package:church_app/src/widgets/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserData(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedEvent(),
        ),
        ChangeNotifierProvider(
          create: (_) => AllEventsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
    // return ;
  }
}
