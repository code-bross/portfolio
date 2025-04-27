import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/services/servicesDesktop.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/serviceCard.dart';
import 'package:provider/provider.dart';

class ServiceMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomSectionHeading(text: "\nWhat I Do"),
          CustomSectionSubHeading(
              text: "Android Native, Cross platform via Flutter, CI/CD\n\n"),
          CarouselSlider.builder(
            itemCount: serviceSections.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ServiceCard(
                cardWidth: width < 650 ? width * 0.8 : width * 0.5,
                cardHeight: width < 650 ? height * 0.37 : height * 0.4,
                serviceIcon: serviceSections[i].icon,
                serviceTitle: serviceSections[i].title,
                serviceDescription: serviceSections[i].description,
                serviceLink: serviceSections[i].link,
                cardBack: ServiceCardBackWidget(
                  serviceSectionModel: serviceSections[i],
                  themeProvider: _themeProvider,
                  height: height,
                  width: width,
                ),
              ),
            ),
            options: CarouselOptions(
                height: width < 450 ? height * 0.4 : height * 0.4,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enableInfiniteScroll: false),
          )
        ],
      ),
    );
  }
}
