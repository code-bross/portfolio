import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';  // URL을 열기 위한 패키지

class SocialMediaIconBtn extends StatelessWidget {
  final String icon;  // 아이콘 URL
  final String socialLink;  // 소셜 링크
  final double height;  // 아이콘 크기
  final double horizontalPadding;  // 아이콘 간의 간격

  SocialMediaIconBtn({
    required this.icon,
    required this.socialLink,
    required this.height,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.network(
          icon,
          height: height,  // 아이콘의 높이를 지정
          color: _themeProvider.lightTheme ? Colors.black : Colors.white, // 테마에 맞는 색상 설정
        ),
        onPressed: () => _launchURL(socialLink),  // URL 열기 함수
        hoverColor: kPrimaryColor,  // 마우스를 올렸을 때의 색상
      ),
    );
  }

  // URL을 열기 위한 메서드
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
