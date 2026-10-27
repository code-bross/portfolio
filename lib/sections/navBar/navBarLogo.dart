import 'package:flutter/material.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class NavBarLogo extends StatelessWidget {
  final double height;

  const NavBarLogo({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "< "),
              TextSpan(
                text: host.nickName,
                style: const TextStyle(fontFamily: "Agustina"),
              ),
              const TextSpan(text: " />"),
            ],
          ),
          maxLines: 1,
          softWrap: false,
          style: TextStyle(
            fontSize: height,
            height: 1.4,
            color: _themeProvider.lightTheme ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
