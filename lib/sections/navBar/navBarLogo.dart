import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class NavBarLogo extends StatelessWidget {
  final double height;

  NavBarLogo({required this.height});

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 20.0, 20.0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Text(
            "< ",
            style: TextStyle(
              fontSize: height,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          )),
          Flexible(
              child: Text(
            host.nickName,
            style: TextStyle(
              fontFamily: "Agustina",
              fontSize: height,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          )),
          Flexible(
              child: Text(
            MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
            style: TextStyle(
              fontSize: height,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ))
        ],
      ),
    );
  }
}
