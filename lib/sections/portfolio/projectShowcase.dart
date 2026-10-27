import 'package:flutter/material.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:provider/provider.dart';

class ProjectShowcase extends StatelessWidget {
  const ProjectShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightTheme = context.watch<ThemeProvider>().lightTheme;
    final foreground = lightTheme ? const Color(0xff171717) : Colors.white;
    final secondary =
        lightTheme ? const Color(0xff525252) : const Color(0xffbdbdbd);

    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.maxWidth < 600 ? 20.0 : 40.0;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 64,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: LayoutBuilder(
                builder: (context, contentConstraints) {
                  final width = contentConstraints.maxWidth;
                  final columns = width >= 1080 ? 3 : (width >= 640 ? 2 : 1);
                  const gap = 24.0;
                  final cardWidth = (width - gap * (columns - 1)) / columns;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECTED WORK",
                        style: TextStyle(
                          color: lightTheme
                              ? kPrimaryColor
                              : const Color(0xffff9a8f),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "주요 프로젝트",
                        style: TextStyle(
                          color: foreground,
                          fontSize: width < 600 ? 32 : 40,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "개발과 운영에 참여한 모바일 서비스를 소개합니다.",
                        style: TextStyle(
                          color: secondary,
                          fontSize: 16,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (final project in projects)
                            ProjectCard.showcase(
                              projectModel: project,
                              cardWidth: cardWidth,
                            ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      OutlinedButton.icon(
                        onPressed: () => launchURL(context, host.githubUrl),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text("GitHub에서 더 보기"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: foreground,
                          side: BorderSide(color: secondary),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
