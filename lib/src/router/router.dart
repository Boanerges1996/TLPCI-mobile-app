import 'package:church_app/src/provider/selectedEvent.dart';
import 'package:church_app/src/widgets/first/forgottenPass.dart';
import 'package:church_app/src/widgets/first/login.dart';
import 'package:church_app/src/widgets/first/signup.dart';
import 'package:church_app/src/widgets/first/verifyAccount.dart';
import 'package:church_app/src/widgets/homepage.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/postEvent.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/singleEventPage.dart';
import 'package:church_app/src/widgets/userpage/profile/profilePage.dart';
import 'package:church_app/src/widgets/userpage/userpage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case '/forgotten/password':
        return MaterialPageRoute(
          builder: (_) => ForgottenPassword(),
        );

      case '/userpage':
        return MaterialPageRoute(
          builder: (_) => UserPage(),
        );

      case '/post/event':
        return MaterialPageRoute(
          builder: (_) => PostEventForm(),
        );
      case '/verify/email':
        return MaterialPageRoute(
          builder: (_) => VerifyEmail(),
        );
      case '/profile/page':
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );
      case '/selected/event':
        return MaterialPageRoute(
          builder: (_) => SingleEventPage(),
        );
    }
  }
}
