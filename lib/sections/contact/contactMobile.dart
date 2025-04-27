import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:provider/provider.dart';

class ContactMobileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomSectionHeading(text: "\nContacts"),
          CustomSectionSubHeading(
              text: "\n\n"),
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ProjectCard(
                cardWidth: width > 480 ? width * 0.5 : width * 0.8,
                cardHeight: width < 480 ? height * 0.28 : height * 0.25,
                projectIconData: kContactIcons[i],
                projectModel: ProjectModel(kContactTitles[i],
                    kContactDetails[i], '', '', '','',[]),
              ),
            ),
            options: CarouselOptions(
                height: height * 0.3,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enableInfiniteScroll: false),
          ),
        ],
      ),
    );
  }
}
