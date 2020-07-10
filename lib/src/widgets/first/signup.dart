import 'package:church_app/src/request/signup.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  bool internet = false;
  bool clickedSignUp = false;
  bool exist = false;

  String nameText;
  String emailText;
  String usernameText;
  String passwordText;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
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
            (internet == true ? internetError() : Text("")),
            (exist == true ? existError() : Text("")),
            SizedBox(
              height: 40,
            ),
            Text(
              "Signup",
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),

            name(context),
            SizedBox(
              height: 10,
            ),
            token(context),
            SizedBox(
              height: 10,
            ),
            email(context),
            SizedBox(
              height: 10,
            ),
            password(context),
            SizedBox(
              height: 10,
            ),
            signup(context),
            SizedBox(
              height: 5,
            ),
            (clickedSignUp == true ? loadingWidget() : Text("")),
            gotoLogin(context)
            // (clickSignUp == true ? loadingWidget() : Text(""))
          ],
        ),
      ),
    ));
  }

  Widget name(context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "name",
        labelText: "name",
        labelStyle: TextStyle(
          color: const Color(0xff4a148c),
        ),
      ),
      onSaved: (value) {
        setState(() {
          nameText = value;
        });
      },
      validator: (value) {
        if (value.length == 0) {
          return "Please enter a name";
        } else {
          return null;
        }
      },
    );
  }

  Widget token(context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Boanerges",
        labelText: "Username",
        labelStyle: TextStyle(
          color: const Color(0xff4a148c),
        ),
      ),
      onSaved: (value) {
        setState(() {
          usernameText = value;
        });
      },
      validator: (value) {
        if (value.length == 0) {
          return "Please enter a username";
        } else {
          return null;
        }
      },
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
      onSaved: (value) {
        setState(() {
          emailText = value;
        });
      },
      validator: (value) {
        if (RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return null;
        } else {
          return "Please enter a valied email";
        }
      },
    );
  }

  Widget password(context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "******",
        labelText: "password",
        labelStyle: TextStyle(
          color: Color(0xff4a148c),
        ),
      ),
      onSaved: (value) {
        passwordText = value;
      },
      validator: (value) {
        if (value.length < 6) {
          return "Password must be at least 6 characters";
        } else {
          return null;
        }
      },
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

  Widget signup(context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50,
      child: RaisedButton(
        color: const Color(0xfae91e63),
        child: Text(
          "Signup",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif'),
        ),
        onPressed: () async {
          if (formKey.currentState.validate()) {
            setState(() {
              clickedSignUp = true;
            });
            formKey.currentState.save();
            SignUpRequest sign = SignUpRequest(
                email: emailText,
                password: passwordText,
                username: usernameText,
                name: nameText);
            var response = await sign.signup();
            if (response == null) {
              setState(() {
                internet = true;
              });
              offInternetError();
            } else {
              if (response["exist"] == true) {
                setState(() {
                  exist = true;
                });
                offExistError();
              } else {
                Navigator.of(context).popAndPushNamed('/verify/email');
              }
            }
            setState(() {
              clickedSignUp = false;
            });
          }
        },
      ),
    );
  }

  Widget gotoLogin(context) {
    return ListTile(
      leading: Text(
        "Already got an account",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: FlatButton(
        child: Text(
          "Login",
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/login');
        },
      ),
      // title: Text("Login"),
    );
  }

  Widget internetError() {
    return Container(
      child: Text(
        "Please check your internet conecttion",
        style: TextStyle(
          color: Colors.red,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget existError() {
    return Container(
      child: Text(
        "Please this email account is already registered",
        style: TextStyle(
          color: Colors.red,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  void offInternetError() async {
    await Future.delayed(new Duration(seconds: 3));
    setState(() {
      internet = false;
    });
  }

  void offExistError() async {
    await Future.delayed(new Duration(seconds: 3));
    setState(() {
      exist = false;
    });
  }
}
