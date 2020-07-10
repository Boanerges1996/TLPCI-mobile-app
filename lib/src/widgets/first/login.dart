import 'package:church_app/src/provider/userProvider.dart';
import 'package:church_app/src/request/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  bool clickedLogin = false;
  bool invalidCred = false;
  bool exist = false;
  String email;
  String password;

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
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style:
                    GoogleFonts.merriweather(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              (invalidCred == true ? invalidCredential() : Text("")),
              (exist == true ? doesNotExist() : Text("")),
              emailField(context),
              SizedBox(
                height: 10,
              ),
              passwordWdg(context),
              SizedBox(
                height: 10,
              ),
              loginBtn(context),
              SizedBox(
                height: 5,
              ),
              (clickedLogin == true ? loadingWidget() : Text("")),
              haveAccount(context),
              SizedBox(
                height: 5,
              ),
              forgottenPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(context) {
    return Theme(
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: "email",
            hintStyle: TextStyle(fontSize: 25),
            hintText: "example@123.com",
            prefixIcon: Icon(
              FontAwesomeIcons.user,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF784ADE),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          autovalidate: true,
          onSaved: (em) {
            setState(() {
              email = em;
            });
          }),
      data: Theme.of(context).copyWith(primaryColor: Color(0xFF784ADE)),
    );
  }

  Widget passwordWdg(context) {
    return Theme(
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: "password",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "Enter password",
          prefixIcon: Icon(
            FontAwesomeIcons.lock,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF784ADE),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        autovalidate: true,
        onSaved: (pass) {
          setState(() {
            password = pass;
          });
        },
      ),
      data: Theme.of(context).copyWith(primaryColor: Color(0xFF784ADE)),
    );
  }

  Widget loginBtn(context) {
    UserData datas = Provider.of<UserData>(context);
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 60,
      child: RaisedButton(
        color: Color(0xfae91e63),
        child: Text(
          "Login",
          style: GoogleFonts.merriweather(
            color: Colors.white,
          ),
        ),
        onPressed: () async {
          // Navigator.of(context).pushNamed('/userpage');
          formKey.currentState.save();
          setState(() {
            clickedLogin = true;
          });
          try {
            print(email);
            print(password);
            var log = new LoginRequest(email: email, password: password);
            Map result = await log.login();
            if (result["invalid"] == true) {
              setState(() {
                clickedLogin = false;
              });
              showErrorInvalid();
            } else if (result["exists"] == false) {
              setState(() {
                clickedLogin = false;
              });
              showErrorDoesNotExist();
            } else if (result["logged"] == true) {
              setState(() {
                clickedLogin = false;
              });
              if (result["verify"] == false) {
                Navigator.of(context).popAndPushNamed('/verify/email');
              } else {
                datas.setInfo(result);
                // Saving data into sharedPreference
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool("logged", true);
                pref.setString("url", result["url"]);
                pref.setString("username", result["username"]);
                pref.setString("email", result["email"]);
                pref.setString("_id", result["_id"]);
                pref.setString("name", result["name"]);
                pref.setBool("isPastor", result["isPastor"]);
                print(result);
                Navigator.of(context).pushNamed("/userpage");
              }
            }
            print(result);
          } catch (err) {
            print(err);
          }
        },
      ),
    );
  }

  Widget haveAccount(context) {
    return GestureDetector(
      onTap: () {
        // Go to signup
        Navigator.of(context).pushNamed('/signup');
      },
      child: Text(
        "Dont have an account Signup",
        style: GoogleFonts.merriweather(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget forgottenPassword(context) {
    return GestureDetector(
      onTap: () {
        // Go to signup
        Navigator.of(context).pushNamed('/forgotten/password');
      },
      child: Text(
        "Forgotten Password",
        style: GoogleFonts.merriweather(
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: LoadingFlipping.circle(
        borderColor: Colors.pinkAccent,
        borderSize: 3.0,
        size: 30.0,
        backgroundColor: Colors.pink,
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  Widget invalidCredential() {
    return Center(
      child: Text(
        "Email or password invalid",
        style: GoogleFonts.adamina(color: Colors.red, fontSize: 20),
      ),
    );
  }

  Widget doesNotExist() {
    return Center(
      child: Text(
        "No such account exist",
        style: GoogleFonts.adamina(color: Colors.red, fontSize: 20),
      ),
    );
  }

  void showErrorInvalid() async {
    setState(() {
      invalidCred = true;
    });
    await Future.delayed(new Duration(seconds: 3));
    setState(() {
      invalidCred = false;
    });
  }

  void showErrorDoesNotExist() async {
    setState(() {
      exist = true;
    });
    await Future.delayed(new Duration(seconds: 3));
    setState(() {
      exist = false;
    });
  }
}
