import 'package:flutter/material.dart';
import 'package:folio/sections/skills/skills_desktop.dart';
import 'package:folio/sections/skills/skills_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Skills extends StatelessWidget {
  Skills(GlobalKey key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SkillMobile(),
      tablet: SkillMobile(),
      desktop: SkillDesktop(),
    );
  }
}
