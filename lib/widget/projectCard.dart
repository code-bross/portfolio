import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../sections/serviceDetails/serviceDetails.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel projectModel;
  final IconData? projectIconData; // Nullable
  final double cardWidth;
  final double cardHeight;
  final Widget? bottomWidget; // Nullable
  final bool _showcase;

  const ProjectCard({
    Key? key,
    required this.projectModel,
    this.projectIconData,
    this.bottomWidget,
    required this.cardWidth,
    required this.cardHeight,
  })  : _showcase = false,
        super(key: key);

  const ProjectCard.showcase({
    Key? key,
    required this.projectModel,
    required this.cardWidth,
  })  : cardHeight = 0,
        projectIconData = null,
        bottomWidget = null,
        _showcase = true,
        super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  void _openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ServiceDetails(projectModel: widget.projectModel),
      ),
    );
  }

  Widget _buildShowcase(bool lightTheme) {
    final project = widget.projectModel;
    final foreground = lightTheme ? const Color(0xff171717) : Colors.white;
    final secondary =
        lightTheme ? const Color(0xff525252) : const Color(0xffbdbdbd);
    final accent = lightTheme ? kPrimaryColor : const Color(0xffff9a8f);
    final hasDetails = project.storeImages.isNotEmpty;
    final borderRadius = BorderRadius.circular(20);

    return SizedBox(
      width: widget.cardWidth,
      child: Material(
        color: lightTheme ? Colors.white : const Color(0xff171717),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(
            color: isHover
                ? accent
                : (lightTheme
                    ? const Color(0xffe5e5e5)
                    : const Color(0xff333333)),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: hasDetails ? _openDetails : null,
          onHover: (value) => setState(() => isHover = value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (project.backgroundImage.isNotEmpty)
                Ink(
                  height: widget.cardWidth * 9 / 16,
                  decoration: BoxDecoration(
                    color: lightTheme
                        ? const Color(0xfff5f5f5)
                        : const Color(0xff222222),
                    image: DecorationImage(
                      image: AssetImage(project.backgroundImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (project.icon.isNotEmpty) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          project.icon,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    Text(
                      project.title,
                      style: TextStyle(
                        color: foreground,
                        fontSize: 22,
                        height: 1.4,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project.subTitle,
                      style: TextStyle(
                        color: secondary,
                        fontSize: 16,
                        height: 1.65,
                      ),
                    ),
                    if (hasDetails) ...[
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "프로젝트 상세 보기",
                              style: TextStyle(
                                color: accent,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: accent, size: 20),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    if (widget._showcase) {
      return _buildShowcase(_themeProvider.lightTheme);
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        if (widget.projectModel.storeImages.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ServiceDetails(
                projectModel: widget.projectModel,
              ),
            ),
          );
        }
      },
      onHover: (isHovering) {
        setState(() {
          isHover = isHovering;
        });
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
                        : Colors.grey[900] ?? Colors.grey,
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
                if (widget.projectModel.icon.isNotEmpty)
                  (width > 1135 || width < 950)
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
                            SizedBox(width: width * 0.01),
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
                        ),
                if (widget.projectIconData != null)
                  Icon(
                    widget.projectIconData!,
                    color: kPrimaryColor,
                    size: height * 0.1,
                  ),
                if (width > 1135 || width < 950)
                  SizedBox(height: height * 0.02),
                if (width > 1135 || width < 950)
                  AdaptiveText(
                    widget.projectModel.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: height * 0.02,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                SizedBox(height: height * 0.01),
                AdaptiveText(
                  widget.projectModel.subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: height * 0.015,
                    letterSpacing: 2.0,
                    color:
                        _themeProvider.lightTheme ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w300,
                    height: width >= 600 ? 2.0 : 1.2,
                  ),
                ),
                SizedBox(height: height * 0.01),
                widget.bottomWidget ?? Container(),
              ],
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: width < 760 ? 0.18 : (isHover ? 0.0 : 1.0),
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
}
