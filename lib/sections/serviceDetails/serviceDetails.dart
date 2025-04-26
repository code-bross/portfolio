import 'package:flutter/material.dart';
import 'package:folio/sections/serviceDetails/serviceDetailsDesktop.dart';
import 'package:folio/sections/serviceDetails/serviceDetailsMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../constants.dart';

class ServiceDetails extends StatelessWidget {
  final ProjectModel projectModel;

  // Making projectModel a required parameter in the constructor
  const ServiceDetails({Key? key, required this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ServiceDetailsMobile(
        projectModel: projectModel,
      ),
      tablet: ServiceDetailsMobile(
        projectModel: projectModel,
      ),
      desktop: ServiceDetailsDesktop(
        projectModel: projectModel,
      ),
    );
  }
}
