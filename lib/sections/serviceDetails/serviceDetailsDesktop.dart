import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceDetailsDesktop extends StatelessWidget {
  final ProjectModel projectModel;

  const ServiceDetailsDesktop({Key key, this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: _themeProvider.lightTheme ? Colors.white : Colors.black,
      body: Row(
        children: [
          Expanded(
              child: ServiceDetailsDescription(projectModel: projectModel)),
          Expanded(child: ServicesShowCase(projectModel: projectModel)),
        ],
      ),
    );
  }
}

class ServiceDetailsDescription extends StatelessWidget {
  final ProjectModel projectModel;

  const ServiceDetailsDescription({Key key, this.projectModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.only(
          left: 50.0, top: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ),
          const SizedBox(height: 25.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.play_arrow_rounded,
                color: kPrimaryColor,
              ),
              const SizedBox(width: 8.0),
              AdaptiveText(
                projectModel.title,
                style: GoogleFonts.montserrat(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: _themeProvider.lightTheme
                        ? Colors.black
                        : Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Container(),
          const SizedBox(height: 15.0),
          Expanded(
              child: AdaptiveText(
            projectModel.description,
            style: GoogleFonts.montserrat(
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
                fontSize: 20.0,
                letterSpacing: 1.2,
                height: 3.0),
          )),
        ],
      ),
    );
  }
}

class ServicesShowCase extends StatefulWidget {
  final ProjectModel projectModel;

  const ServicesShowCase({Key key, this.projectModel}) : super(key: key);

  @override
  _ServicesShowCaseState createState() => _ServicesShowCaseState();
}

class _ServicesShowCaseState extends State<ServicesShowCase> {
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  bool _autoPlay = true;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
          boxShadow: _themeProvider.lightTheme
              ? [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(-2, 0),
                    blurRadius: 12.0,
                  )
                ]
              : []),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdaptiveText(" My Previous Work",
              style: GoogleFonts.montserrat(
                  fontSize: 24.0,
                  letterSpacing: 1.2,
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white)),
          const SizedBox(height: 20.0),
          Row(
            children: [
              AdaptiveText(
                " ${widget.projectModel.title}",
                style: GoogleFonts.montserrat(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color:
                      _themeProvider.lightTheme ? Colors.black : Colors.white,
                ),
              ),
              Container(),
              Expanded(child: Container()),
              IconButton(
                onPressed: () => launchURL(context, widget.projectModel.link),
                icon: Icon(Icons.arrow_forward,
                    color: _themeProvider.lightTheme
                        ? Colors.black
                        : Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          InkWell(
            onTap: () {},
            mouseCursor: MouseCursor.defer,
            onHover: (hovering) {
              if (hovering) {
                setState(() {
                  _autoPlay = false;
                });
              } else {
                setState(() {
                  _autoPlay = true;
                });
              }
            },
            child: Stack(
              children: [
                Container(
                  height: screenSize.height * 0.55,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(widget.projectModel.backgroundImage),
                          fit: BoxFit.cover)),
                  child: SizedBox(
                    height: screenSize.height * 0.55,
                    width: screenSize.width,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: CarouselSlider.builder(
                      itemCount: widget.projectModel.storeImages.length,
                      carouselController: _carouselController,
                      itemBuilder: (context, index, i) => Image.asset(
                        widget.projectModel.storeImages[index],
                        height: 300.0,
                      ),
                      options: CarouselOptions(
                          autoPlay: _autoPlay,
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
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
        ],
      ),
    );
  }
}
