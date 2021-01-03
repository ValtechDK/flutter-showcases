import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'curved_painter.dart';
import 'custom_textfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valtech Awesome Profile UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: CurvedPainter(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: GoogleFonts.sourceSansPro(color: Constants.profileTitleColor, fontSize: 30),
                      ),
                      FloatingActionButton(
                          child: Icon(Icons.edit),
                          mini: true,
                          onPressed: null,
                          backgroundColor: Constants.editButtonColor)
                    ],
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Text(
                                  'Jasmine',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.sourceSansPro(
                                    color: Constants.usernameColor,
                                    fontSize: 45,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(labelText: 'Name'),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(labelText: 'Surname'),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(labelText: 'Email'),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(labelText: 'Mobile'),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(labelText: 'Password'),
                              SizedBox(
                                height: 10,
                              ),
                              FractionalTranslation(
                                translation: Offset(0, 0.5),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(0.0),
                                  shape: StadiumBorder(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      gradient: LinearGradient(colors: [
                                        Constants.saveButtonStartColor,
                                        Constants.saveButtonEndColor,
                                      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                                    ),
                                    child: Text(
                                      'Save',
                                      style: GoogleFonts.sourceSansPro(fontSize: 15.0),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0, -.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                gradient: LinearGradient(colors: [
                                  Constants.profileAvatarBackStartColor,
                                  Constants.profileAvatarBackEndColor
                                ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                                shadows: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              width: 160,
                              height: 160,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 70,
                                backgroundImage: AssetImage('assets/woman.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(
                                'Hello.!',
                                style: GoogleFonts.sourceSansPro(color: Constants.helloTextColor, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ),
                      FractionalTranslation(
                        translation: Offset(0, -0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              onPressed: null,
                              child: FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                size: 20,
                              ),
                              backgroundColor: Constants.googlePlusButtonColor,
                              mini: true,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FloatingActionButton(
                              onPressed: null,
                              child: FaIcon(
                                FontAwesomeIcons.facebookF,
                                size: 20,
                              ),
                              backgroundColor: Constants.facebbookButtonColor,
                              mini: true,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FloatingActionButton(
                              onPressed: null,
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 20,
                              ),
                              backgroundColor: Constants.twitterButtonColor,
                              mini: true,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
