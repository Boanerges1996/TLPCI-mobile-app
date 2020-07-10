import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
import 'package:church_app/src/provider/userProvider.dart';
import 'package:church_app/src/request/postEvent.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class PostEventForm extends StatefulWidget {
  @override
  _PostEventFormState createState() => _PostEventFormState();
}

class _PostEventFormState extends State<PostEventForm> {
  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  File _selectedImage = null;

  String contentText;
  String titleText;
  String localityText;

  bool clickedSubmit = false;

  ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Post Event"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                heading(),
                SizedBox(
                  height: 30,
                ),
                title(context),
                SizedBox(
                  height: 10,
                ),
                locality(context),
                SizedBox(
                  height: 10,
                ),
                textArea(context),
                uploadEventPicture(),
                _selectedImage == null ? Text("") : selectedImage(),
                SizedBox(
                  height: 10,
                ),
                postEventButton(context),
                (clickedSubmit == true ? loadingWidget() : Text(""))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget heading() {
    return Center(
      child: Text(
        "Post Event Form",
        style: GoogleFonts.acme(fontSize: 24),
      ),
    );
  }

  Widget title(context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Event title",
      ),
      validator: (value) {
        if (value.length == 0) {
          return "Please filed is required";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        titleText = value;
      },
    );
  }

  Widget locality(context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Locality",
      ),
      validator: (value) {
        if (value.length == 0) {
          return "Please filed is required";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        localityText = value;
      },
    );
  }

  Widget textArea(context) {
    return TextField(
      maxLines: 8,
      decoration: InputDecoration(hintText: "Enter event description of event"),
      onChanged: (value) {
        setState(() {
          contentText = value;
        });
      },
    );
  }

  Widget uploadEventPicture() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text(
            "Upload event cover picture",
            style: GoogleFonts.acme(
              fontSize: 18,
            ),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.camera),
            onPressed: getImage,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget selectedImage() {
    return Card(
      child: Image.file(
        _selectedImage,
        height: 250,
        width: double.infinity,
      ),
    );
  }

  Widget postEventButton(context) {
    UserData myInfo = Provider.of<UserData>(context);
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50,
      child: RaisedButton(
        color: Color(0xff4a148c),
        child: Text(
          "Save Event",
          style: GoogleFonts.acme(fontSize: 20, color: Colors.white),
        ),
        onPressed: () async {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            setState(() {
              clickedSubmit = true;
            });
            String fileName = basename(_selectedImage.path);
            StorageReference ref =
                FirebaseStorage.instance.ref().child("events" + fileName);
            StorageUploadTask uploadTask = ref.putFile(_selectedImage);
            StorageTaskSnapshot taskSanpShop = await uploadTask.onComplete;
            var urls = await taskSanpShop.ref.getDownloadURL();
            PostEventRequest newEvent = PostEventRequest(
              url: urls,
              author: myInfo.getUserInfo["name"],
              locality: localityText,
              id: myInfo.getUserInfo["_id"],
              title: titleText,
              content: contentText,
            );
            var result = await newEvent.registerEvent();

            formKey.currentState.reset();
            setState(() {
              clickedSubmit = false;
              _selectedImage = null;
            });
            if (result != null) {
              showSnackBar();
            }
          }
        },
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Loading(
        color: Colors.pink,
        indicator: BallSpinFadeLoaderIndicator(),
        size: 50,
      ),
    );
  }

  showSnackBar() {
    final snackbar = new SnackBar(
      duration: new Duration(seconds: 3),
      backgroundColor: Colors.pink,
      content: Text(
        "Event registered successfully",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    _scaffold.currentState.showSnackBar(snackbar);
  }
}
