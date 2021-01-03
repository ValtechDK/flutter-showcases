import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  const CustomTextField({
    Key key,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.textFieldColor),
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.sourceSansPro(color: Constants.textFieldColor, fontSize: 20),
        border: OutlineInputBorder(borderSide: BorderSide(color: Constants.textFieldColor)),
      ),
    );
  }
}
