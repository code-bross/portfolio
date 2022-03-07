import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceDetailsMobile extends StatefulWidget {
  final ProjectModel projectModel;

  const ServiceDetailsMobile({Key key, this.projectModel})
      : super(key: key);

  @override
  _ServiceDetailsMobileState createState() => _ServiceDetailsMobileState();
}

class _ServiceDetailsMobileState extends State<ServiceDetailsMobile> {
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: AdaptiveText(widget.projectModel.title),
      ),
      backgroundColor: _themeProvider.lightTheme ? Colors.white : Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdaptiveText(
                "My Previous Work",
                style: TextStyle(
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              AdaptiveText(
                widget.projectModel.title,
                style: GoogleFonts.montserrat(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              CarouselSlider.builder(
                itemCount: widget.projectModel.storeImages.length,
                carouselController: _carouselController,
                itemBuilder: (context, index, i) => Image.asset(
                  widget.projectModel.storeImages[index],
                  height: 100.0,
                ),
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: projects.map((project) {
                    int index = projects.indexOf(project);
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: _currentIndex == index ? 25.0 : 7.0,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: _currentIndex == index
                            ? kPrimaryColor
                            : kPrimaryColor.withAlpha(100),
                      ),
                    );
                  }).toList()),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: kPrimaryColor,
                  ),
                  AdaptiveText(
                    widget.projectModel.title,
                    style: GoogleFonts.montserrat(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
              AdaptiveText(
                widget.projectModel.description,
                style: GoogleFonts.montserrat(
                  height: 2.0,
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
