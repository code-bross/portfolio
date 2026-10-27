import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/sections/navBar/navBarLogo.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/sections/serviceDetails/serviceDetails.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _RouteObserver extends NavigatorObserver {
  Route<dynamic>? latestRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    latestRoute = route;
  }
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  Widget app({
    required Widget child,
    bool lightTheme = false,
    double textScale = 1,
    NavigatorObserver? observer,
  }) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider()..lightTheme = lightTheme,
      child: MaterialApp(
        navigatorObservers: [if (observer != null) observer],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(textScale),
          ),
          child: child!,
        ),
        home: Scaffold(body: SingleChildScrollView(child: child)),
      ),
    );
  }

  for (final lightTheme in [false, true]) {
    testWidgets('Logo fits a narrow toolbar and drawer ($lightTheme)',
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(320, 568));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(app(
        lightTheme: lightTheme,
        textScale: 1.5,
        child: SizedBox(
          height: 568,
          child: Scaffold(
            appBar: AppBar(
              title: const Align(
                alignment: Alignment.centerRight,
                child: NavBarLogo(height: 26),
              ),
              titleSpacing: 20,
            ),
            drawer: Drawer(
              child: Center(child: NavBarLogo(height: 28)),
            ),
          ),
        ),
      ));

      final logoText = find.text('< ${host.nickName} />');
      expect(logoText, findsOneWidget);
      final toolbar = tester.getRect(find.byType(AppBar));
      final logo = tester.getRect(logoText);
      expect(logo.left, greaterThanOrEqualTo(56));
      expect(logo.right, lessThanOrEqualTo(toolbar.right));
      expect(logo.top, greaterThanOrEqualTo(toolbar.top));
      expect(logo.bottom, lessThanOrEqualTo(toolbar.bottom));
      expect(tester.takeException(), isNull);

      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      expect(find.byType(NavBarLogo), findsNWidgets(2));
      expect(tester.takeException(), isNull);
    });

    for (final width in [320.0, 360.0, 390.0, 760.0, 1024.0, 1440.0]) {
      testWidgets('Projects are readable at $width ($lightTheme)',
          (tester) async {
        await tester.binding.setSurfaceSize(Size(width, 568));
        addTearDown(() => tester.binding.setSurfaceSize(null));

        await tester.pumpWidget(app(
          lightTheme: lightTheme,
          textScale: 1.5,
          child: Portfolio(GlobalKey()),
        ));
        await tester.pump();

        expect(find.byType(ProjectCard), findsNWidgets(projects.length));
        for (final project in projects) {
          expect(find.text(project.title), findsOneWidget);
          expect(find.text(project.subTitle), findsOneWidget);
        }
        expect(find.text('GitHub에서 더 보기'), findsOneWidget);
        final cards = find.byType(ProjectCard);
        final first = tester.getRect(cards.at(0));
        final second = tester.getRect(cards.at(1));
        expect(first.left, greaterThanOrEqualTo(20));
        expect(first.right, lessThanOrEqualTo(width - 20));
        if (width < 720) {
          expect(second.top, greaterThan(first.bottom));
        } else {
          expect(second.top, first.top);
          expect(second.left, greaterThan(first.right));
        }
        if (width == 1440) {
          expect(tester.getRect(cards.at(2)).top, first.top);
          expect(tester.getRect(cards.at(3)).top, greaterThan(first.bottom));
        }
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('Long project copy grows without clipping', (tester) async {
    await tester.binding.setSurfaceSize(const Size(320, 568));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    const project = ProjectModel(
      '긴 프로젝트 제목과 Long English Project Name',
      '긴 한국어 설명과 English summary remain visible without shrinking the text.',
      '',
      '',
      '',
      '',
      [],
    );

    await tester.pumpWidget(app(
      textScale: 2,
      child: const ProjectCard.showcase(
        projectModel: project,
        cardWidth: 280,
      ),
    ));

    expect(find.text(project.title), findsOneWidget);
    expect(find.text(project.subTitle), findsOneWidget);
    expect(find.text('프로젝트 상세 보기'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('A project tap opens details for the selected project',
      (tester) async {
    final observer = _RouteObserver();
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(app(
      observer: observer,
      child: ProjectCard.showcase(
        projectModel: projects.first,
        cardWidth: 350,
      ),
    ));
    await tester.tap(find.text(projects.first.title));

    final route = observer.latestRoute;
    expect(route, isA<MaterialPageRoute<dynamic>>());
    final details = (route as MaterialPageRoute<dynamic>)
        .builder(tester.element(find.byType(ProjectCard)));
    expect(details, isA<ServiceDetails>());
    expect((details as ServiceDetails).projectModel, same(projects.first));
    await tester.pumpWidget(const SizedBox());
    expect(tester.takeException(), isNull);
  });
}
