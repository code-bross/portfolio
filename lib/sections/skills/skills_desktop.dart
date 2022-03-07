import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:provider/provider.dart';
import '../../widget/skill_item.dart';

class SkillDesktop extends StatefulWidget {
  @override
  _SkillDesktopState createState() => _SkillDesktopState();
}

class _SkillDesktopState extends State<SkillDesktop> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nSkills"),
          SizedBox(
            height: width > 1200 ? height * 0.65 : width * 0.39,
            child: Container(
                margin: EdgeInsets.fromLTRB(
                    width * 0.1, height * 0.2, width * 0.1, 0),
                child: Column(
                  children: skillWidgets(_themeProvider),
                )),
          ),
        ],
      ),
    );
  }
}
