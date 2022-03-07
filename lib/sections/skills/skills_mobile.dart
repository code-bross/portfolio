import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../widget/skill_item.dart';

class SkillMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skills",
                  style: GoogleFonts.montserrat(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: height * 0.055,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.035,
                ),
                Flexible(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: skillWidgets(_themeProvider)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
