import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../provider/themeProvider.dart';

List<Widget> skillWidgets(ThemeProvider themeProvider) {
  return skills
      .map(
        (skill) => Flexible(child:  Container(
          margin: EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: [
              Expanded(
                flex: skill.percentage,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  height: 38.0,
                  child: Text(
                    skill.skill,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0,
                      color: themeProvider.lightTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                // remaining (blank part)
                flex: 100 - skill.percentage,
                child: Divider(
                  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "${skill.percentage}%",
                style: TextStyle(
                  color: themeProvider.lightTheme ? Colors.black : Colors.white,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        )),
      )
      .toList();
}
