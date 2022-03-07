import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../sections/serviceDetails/serviceDetails.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel projectModel;
  final IconData projectIconData;
  final double cardWidth;
  final double cardHeight;
  final Widget bottomWidget;

  const ProjectCard(
      {Key key,
      this.projectModel,
      this.bottomWidget,
      this.projectIconData,
      this.cardWidth,
      this.cardHeight})
      : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;


  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => {
        if(widget.projectModel.storeImages.isNotEmpty){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ServiceDetails(
                      projectModel: widget.projectModel,
                    ),
              ))
        }
      },
      onHover: (isHovering) {
        if (isHovering) {
          setState(() {
            isHover = true;
          });
        } else {
          setState(() {
            isHover = false;
          });
        }
      },
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
          border: Border(
            bottom: isHover
                ? BorderSide(
                    color: kPrimaryColor,
                    width: 3.0,
                  )
                : BorderSide(
                    color: _themeProvider.lightTheme
                        ? Colors.white
                        : Colors.grey[900],
                  ),
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: kPrimaryColor.withAlpha(100),
                    blurRadius: 12.0,
                    offset: Offset(0.0, 0.0),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 12.0,
                    offset: Offset(0.0, 0.0),
                  )
                ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.projectModel.icon.isNotEmpty
                    ? (width > 1135 || width < 950)
                        ? Image.asset(
                            widget.projectModel.icon,
                            height: height * 0.05,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                widget.projectModel.icon,
                                height: height * 0.03,
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(
                                widget.projectModel.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: height * 0.015,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: _themeProvider.lightTheme
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )
                    : Container(),
                widget.projectIconData != null
                    ? Icon(
                        widget.projectIconData,
                        color: kPrimaryColor,
                        size: height * 0.1,
                      )
                    : Container(),
                (width > 1135 || width < 950)
                    ? SizedBox(
                        height: height * 0.02,
                      )
                    : SizedBox(),
                (width > 1135 || width < 950)
                    ? AdaptiveText(
                        widget.projectModel.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: height * 0.02,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w400,
                          color: _themeProvider.lightTheme
                              ? Colors.white
                              : Colors.grey[900],
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: height * 0.01,
                ),
                AdaptiveText(
                  widget.projectModel.subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: height * 0.015,
                      letterSpacing: 2.0,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.w300,
                      height: width >= 600 ? 2.0 : 1.2),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                widget.bottomWidget ?? Container(),
              ],
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
                child: widget.projectModel.backgroundImage.isNotEmpty
                    ? Image.asset(widget.projectModel.backgroundImage)
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _navigateDetail() async {
    print('test');
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => ServiceDetails(
    //         title: 'test',
    //         dec: 'test',
    //       ),
    //     ));
  }
}
