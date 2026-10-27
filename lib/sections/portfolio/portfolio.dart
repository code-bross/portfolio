import 'package:flutter/material.dart';
import 'package:folio/sections/portfolio/projectShowcase.dart';

class Portfolio extends StatelessWidget {
  Portfolio(GlobalKey key) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ProjectShowcase();
  }
}
