import 'package:flutter/material.dart';
import 'package:folio/sections/services/servicesDesktop.dart';
import 'package:folio/sections/services/servicesMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Services extends StatelessWidget {
  Services(GlobalKey key) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
