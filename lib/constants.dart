import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'generated/assets.dart';

// Colors
const Color kPrimaryColor = Color(0xffC0392B);

// Social Media
const kSocialIcons = [
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  "https://img.icons8.com/ios-filled/50/000000/linkedin-circled--v5.png"
];

const kSocialLinks = [
  "https://github.com/code-bross",
  "https://www.linkedin.com/in/%EC%98%81%EA%B8%B8-%EA%B0%95-833621187"
];

// URL Launcher
void launchURL(BuildContext context, String _url) async =>
    await UrlLauncher.canLaunch(_url)
        ? await _launchURL(context, _url)
        : throw 'Could not launch $_url';

Future<void> _launchURL(BuildContext context, url) async {
  final theme = Theme.of(context);
  try {
    await launchUrl(
      Uri.parse(url),
      customTabsOptions: CustomTabsOptions.partial(
        configuration: PartialCustomTabsConfiguration.adaptiveSheet(
          initialHeight: mediaQuery.size.height * 0.7,
          initialWidth: mediaQuery.size.width * 0.4,
          activitySideSheetMaximizationEnabled: true,
          activitySideSheetDecorationType:
              CustomTabsActivitySideSheetDecorationType.shadow,
          activitySideSheetRoundedCornersPosition:
              CustomTabsActivitySideSheetRoundedCornersPosition.top,
          cornerRadius: 16,
        ),
        colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: theme.colorScheme.surface,
        ),
      ),
      safariVCOptions: SafariViewControllerOptions.pageSheet(
        configuration: const SheetPresentationControllerConfiguration(
          detents: {
            SheetPresentationControllerDetent.large,
            SheetPresentationControllerDetent.medium,
          },
          prefersScrollingExpandsWhenScrolledToEdge: true,
          prefersGrabberVisible: true,
          prefersEdgeAttachedInCompactHeight: true,
        ),
        preferredBarTintColor: theme.colorScheme.surface,
        preferredControlTintColor: theme.colorScheme.onSurface,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}

// Community
final kCommunityLogo = [];

final kCommunityLinks = [
  "https://www.comsats.edu.pk/",
  "https://web.facebook.com/FlutterIslamabadPakistan/",
  "https://dsc.community.dev/comsats-university-islamabad/"
];

// Tools & Tech
final kTools = [
  "Kotlin",
  "Java",
  "Flutter",
  "Dart",
  "JavaScript",
  "Swift",
];

// services
final kServicesIcons = [
  "assets/services/app.png",
  "assets/services/ui.png",
  "assets/services/rapid.png",
  "assets/services/blog.png",
  "assets/services/open.png",
];

final kServicesTitles = [
  "Android App Development",
  "Cross Platform Development",
  "Rapid Prototyping",
  "UI/UX Designing",
  "Open Source - GitHub",
];

// final kServicesDescriptions = [
//   "For now, I can only develop Android Apps using Flutter, that's because I don't own a MacBook right now so can't test or debug apps for iOS. Hopefully this missing piece will be filled soon :)",
//   "Although I'm mainly a flutter developer but I do care about the UI/UX for my client. Hence, I also do UI designing for applications. So, feel free to ask me for getting you UI/UX for your apps",
//   "Having a startup idea? Or maybe just want a prototype for your clients? With Flutter I can get you basic version of your app in no time and you are good to go for your project in future.",
//   "I have been writing technical blogs on Medium for over a year now. So, I can get you technical blogs with awesome header images with interesting topics.\nMy Medium profile @mhamzadev",
//   "Working as open source contributor on GitHub with 200+ stars and numerous forks on various projects liked and shared by other developers.\nMy GitHub Profile @mhmzdev",
// ];

final kServicesDescriptions = [
  "Android app development \n- Kotlin\n- MVVM\n- REST APIs\n- Retrofits\n- RxJava\n- Coroutines\n- DI",
  "Cross platform development via Flutter\n- Android\n- iOS\n- Desktop\n- Web",
  "Rapid Prototype via Flutter\n- Working MVP\n- Quick & Working prototype",
  "Technical Blog writing\n- Medium blogs\n- Soothing header images\n- SEO friendly\n- Researched topics and more..!",
  "Open source GitHub Projects\n- Awesome README.md\n- Well documented\n- Header images and more...!",
];

final kServicesLinks = [
  "https://www.fiverr.com/hamza6shakeel/be-your-mobile-app-developer-via-flutter",
  "https://www.fiverr.com/hamza6shakeel/get-you-modern-ui-design-using-adobe-xd",
  "https://www.fiverr.com/hamza6shakeel/be-your-mobile-app-developer-via-flutter",
  "https://mhamzadev.medium.com",
  "https://github.com/mhmzdev"
];

// projects
final kProjectsBanner = [
  "assets/projects/medkitB.png",
  "assets/projects/quranB.png",
  "assets/projects/hereiamB.png",
  "assets/projects/covidB.png",
];

final kProjectsIcons = [
  "assets/projects/medkit.png",
  "assets/projects/quran.png",
  "assets/projects/hereiam.png",
  "assets/projects/covid.png",
  "assets/projects/messenger.png",
  "assets/projects/flutter.png",
  "assets/projects/earbender.png",
  "assets/projects/java.png",
  "assets/projects/android.png",
  "assets/services/open.png",
];

final kProjectsTitles = [
  "MedKit",
  "The Holy Qur'an",
  "Here I Am",
  "COVID-19",
  "Messenger Chat Head UI",
  "flutter.dev - Flutter Web",
  "Earbender",
  "File Transfer Protocol",
  "My Order",
  "Hidev",
];

final kProjectsDescriptions = [
  "A Phramacy app developed using Flutter powered with Firebase as database with Doctor and Patient panels.",
  "Application of Holy book of Muslims, Al-Qur'an. Developed using Flutter. Powered with live RestAPI given in README.md",
  "Here I am is an Alert app that Sends alert SMS holding your location (Address and Google Maps) to your loved ones.",
  "A live trakcer for COVID19 stats across the Globe and my Home country Pakistan. It uses APIs so the data is live.",
  "Tried to clone the famous Chat Heads by Facebook Messenger using Flutter. Its basically in-app not exactly like the original chat head.",
  "Flutter Official Site clone using Flutter Web. Try the live site here. For the time being its not responsive fully so there might be responsiveness issues.",
  "A concept of Music App developed using Flutter. Having functionality of playing Audio.",
  "A simple GUI based Java application that sends file from Client to Server but not the other way around.",
  "A concept app for self-services at various restaurants now a days. More like a Restaurant Ordering System.",
  "Its my end semester project. The whole design I developed here is an inspiration from my favortie Flutter Developer Marcin Szałek and his blog Fidev."
];

final kProjectsLinks = [
  "https://github.com/mhmzdev/MedKit-Pharmacy-App-Using-Flutter",
  "https://github.com/mhmzdev/The_Holy_Quran_App",
  "https://github.com/mhmzdev/Here-I-Am-Alert-App",
  "https://github.com/mhmzdev/Covid19-Tracker-App",
  "https://github.com/mhmzdev/Messenger-Chat-Head-Flutter-UI",
  "https://github.com/mhmzdev/flutter.dev-Flutter-Web-Clone",
  "https://github.com/mhmzdev/Earbender_Music_App",
  "https://github.com/mhmzdev/FTP_GUI_Java",
  "https://github.com/mhmzdev/My-Order-Resturant-Ordering-System",
  "https://github.com/mhmzdev/Hidev_Web",
];

// Contact
final kContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.mail,
];

final kContactTitles = [
  "Location",
  "Phone",
  "Email",
];

final kContactDetails = [
  "Seoul, Korea",
  "-",
  "rkd2468@icloud.com"
];

final host = PortfolioHost(
    '강영길',
    'z3r0ad',
    '-',
    'rkd2468@icloud.com',
    ['Android Engineer (Main)', 'Mobile Client Engineer', 'Backend Engineer'],
    'https://github.com/code-bross',
    'https://www.linkedin.com/in/%EC%98%81%EA%B8%B8-%EA%B0%95-833621187',
    'assets/assets/resume/resume.pdf',
    'https://code-bross.github.io/portfolio/assets/assets/resume/resume.pdf',
    'Mobile client developer \nBackend developer \n(android, flutter, python)',
    '새로운 아이디어를 도출해내고 실현하는 것을 좋아하며,\n주어진일을 빠르고 효율적으로 처리하는 것을 목표로 합니다.\n현재는 개발자로서 더 성장할 수 있는 방법을 고민 중이며,\n일을 효율적으로 하는 방법, 더 나은 방향으로 커뮤니케이션하는 방법 등에 관심이 많습니다.');

class PortfolioHost {
  final String name;
  final String nickName;
  final String phone;
  final String email;
  final List<String> positions;
  final String githubUrl;
  final String linkedInUrl;
  final String resumePath;
  final String resumeUrl;
  final String aboutMeTitle;
  final String aboutMeDescription;

  const PortfolioHost(
      this.name,
      this.nickName,
      this.phone,
      this.email,
      this.positions,
      this.githubUrl,
      this.linkedInUrl,
      this.resumePath,
      this.resumeUrl,
      this.aboutMeTitle,
      this.aboutMeDescription);
}

var serviceSections = [
  ServiceSectionModel(
      'Android App Development',
      'Android app development \n- Kotlin\n- MVVM\n- REST APIs\n- Retrofits\n- RxJava\n- Coroutines\n- DI',
      'assets/services/app.png',
      ''),
  ServiceSectionModel(
      'Cross Platform Development',
      'Cross platform development via Flutter\n- Android\n- iOS\n- Desktop\n- Web',
      'assets/services/ui.png',
      ''),
  ServiceSectionModel(
      'Backend Development',
      'Backend platform development via Python\n- FastApi\n- Web\n- Swagger',
      'assets/services/api.png',
      ''),
  ServiceSectionModel(
      'CI/CD',
      'CI/CD\n- GithubActions\n- Teamcity\n- Jenkins\n- Gitlab\n- Fastlane\n- FirebaseDistribution\n- GooglePlay\n- Testflight\n -ArgoCD\n -GitOps',
      'assets/services/github_action.png',
      ''),
  ServiceSectionModel(
      'Tools',
      'Tools\n- Jira\n- Github\n- Gitlab\n- GoogleWorkspace\n- Firebase\n- Slack',
      'assets/services/rapid.png',
      ''),
  ServiceSectionModel(
      'WorkStyle',
      'WorkStyle\n- Agile\n- Sprint\n- Kanban\n- CodeReview\n- New Technology\n- Peer2Peer',
      'assets/services/work.png',
      '')
];

class ServiceSectionModel {
  final String title;
  final String description;
  final String icon;
  final String link;

  const ServiceSectionModel(this.title, this.description, this.icon, this.link);
}

var projects = [

  ProjectModel(
      '한국투자증권 MTS',
      '한투 - 한국투자증권,주식,MTS,증권,주식어플,해외주식',
      Assets.projectsLogoKIS,
      'https://play.google.com/store/apps/details?id=com.truefriend.neosmartarenewal',
      Assets.projectsBgKIS,
      "주요업무 : 한국투자증권 MTS 국 앱 개편 및 유지보수\n> 국내 MTS 개편 및 유지보수\n> JUnit Test, Android Instrument UI Test 개발\n> Gitlab 기반의 CI/CD 작업 (Android)\n> sonarqube, sparrow, whitesource analyze, firebase distribution, gitlab release 등\n> FormDe 기반으로 화면이동 설계 \n> Room, Koin 기반으로한 MVI framework 설계\n> 홈 보유, 홈 카드 섹션등 개발",
      [
        Assets.KIS1,
        Assets.KIS2,
        Assets.KIS3,
        Assets.KIS4,
        Assets.KIS5,
        Assets.KIS6,
        Assets.KIS7,
      ]),
  ProjectModel(
      'iKISI',
      '한국투자증권 인도네시아 MTS - iKISI',
      Assets.projectsLogoiKISI,
      'https://play.google.com/store/apps/details?id=com.koreainvestment.indonesia',
      Assets.projectsBgiKISI,
      "주요업무 : 한국투자증권 MTS 인도네시아 앱 신규 개발 및 유지보수\n> 인도네시아 MTS 신규 플랫폼 개발 및 런칭\n> JUnit Test, Android Instrument UI Test 개발\n> GithubAction 기반의 CI/CD 작업 (Android)\n> sonarqube, firebase distribution, github release 등\n> Compose Navigation Component 기반으로 화면이동 설계 \n> Room, Hilt 기반으로한 MVI framework 설계\n> WatchList, 종목 상세 개발 \n> Firebase event tracking을 기반으로 한 User segment 분류",
      [
        Assets.iKISI1,
        Assets.iKISI2,
        Assets.iKISI3,
        Assets.iKISI4,
        Assets.iKISI5,
        Assets.iKISI6,
        Assets.iKISI7,
        Assets.iKISI8,
      ]),
  ProjectModel(
      'iKIS',
      '한국투자증권 베트남 MTS - iKIS',
      Assets.projectsLogoiKIS,
      'https://play.google.com/store/apps/details?id=com.koreainvestment.vietnam',
      Assets.projectsBgiKIS,
      "주요업무 : 한국투자증권 MTS 베트남 앱 신규 개발 및 유지보수\n> 베트남 MTS 신규 플랫폼 개발 및 런칭\n> JUnit Test, Android Instrument UI Test 개발\n> GithubAction 기반의 CI/CD 작업 (Android)\n> sonarqube, firebase distribution, github release 등\n> Compose Navigation Component 기반으로 화면이동 설계 \n> Room, Hilt 기반으로한 MVI framework 설계\n> WatchList, 종목 상세 개발 \n> Firebase event tracking을 기반으로 한 User segment 분류\n> Firebase Inapp message custom 개발",
      [
        Assets.iKIS1,
        Assets.iKIS2,
        Assets.iKIS3,
        Assets.iKIS4,
        Assets.iKIS5,
        Assets.iKIS6,
        Assets.iKIS7
      ]),
  ProjectModel(
      'Kasa',
      '처음 만나는 건물재테크, 카사 - Kasa',
      Assets.projectsLogoKasa,
      'https://play.google.com/store/apps/details?id=network.kasa.exchange',
      Assets.projectsBgKasa,
      "Kasa 앱 신규 개발 및 유지보수\n> 국내 프롭테크 샌드박스 규정내 신규 플랫폼 개발및 런칭\n> JUnit Test, Android Instrument UI Test 개발\n> A/B Test를 위한 Firebase Analytics & RemoteConfig 설계\n> Teamcity 기반의 CI/CD 작업 (iOS/Android)\n> sonarqube, firebase distribution, github release 등\n> Navigation Component 기반으로 화면이동 설계 \n> 하나은행 계좌 생성및 연결작업\n> 차트 라이브러리를 이용한 거래 추이 그래프, 공시지가 추이 그래프 개발 > 카카오 인증서 / 네이버 인증서를 통한 수익자총회 투표 기능 개발\n> Firebase event tracking을 기반으로 한 User segment 분류\n> Firebase Inapp message custom 개발\n> Client chapter leader, iOS engineer 인력관리",
      [
        Assets.kasaBgKasa1,
        Assets.kasaBgKasa2,
        Assets.kasaBgKasa3,
        Assets.kasaBgKasa4,
        Assets.kasaBgKasa5,
        Assets.kasaBgKasa6,
      ]),
  ProjectModel(
      'AlyacM',
      '모바일 그린라이프 - 알약M',
      Assets.projectsLogoAlyacm,
      'https://play.google.com/store/apps/details?id=com.estsoft.alyac',
      Assets.projectsBgAlyacm,
      "주요업무 : Kasa 앱 신규 개발 및 유지보수\n> 국내 프롭테크 샌드박스 규정내 신규 플랫폼 개발및 런칭\n> JUnit Test, Android Instrument UI Test 개발\n> A/B Test를 위한 Firebase Analytics & RemoteConfig 설계\n> Teamcity 기반의 CI/CD 작업 (iOS/Android)\n> sonarqube, firebase distribution, github release 등\n> Navigation Component 기반으로 화면이동 설계 > 하나은행 계좌 생성및 연결작업\n> 차트 라이브러리를 이용한 거래 추이 그래프, 공시지가 추이 그래프 개발 > 카카오 인증서 / 네이버 인증서를 통한 수익자총회 투표 기능 개발\n> Firebase event tracking을 기반으로 한 User segment 분류\n> Firebase Inapp message custom 개발\n> Client chapter leader, iOS engineer 인력관리",
      [
        Assets.alyacmAlyacm1,
        Assets.alyacmAlyacm2,
        Assets.alyacmAlyacm3,
        Assets.alyacmAlyacm4,
        Assets.alyacmAlyacm5,
        Assets.alyacmAlyacm6,
        Assets.alyacmAlyacm7,
        Assets.alyacmAlyacm8,
      ]),
];

class ProjectModel {
  final String title;
  final String subTitle;
  final String icon;
  final String link;
  final String backgroundImage;
  final String description;
  final List<String> storeImages;

  const ProjectModel(this.title, this.subTitle, this.icon, this.link,
      this.backgroundImage, this.description, this.storeImages);
}

class SkillModel {
  final String skill;
  final int percentage;

  SkillModel({
    required this.skill,
    required this.percentage,
  });
}

List<SkillModel> skills = [
  SkillModel(skill: 'ReactiveX', percentage: 90),
  SkillModel(skill: 'Coroutine', percentage: 85),
  SkillModel(skill: 'Junit-Test', percentage: 80),
  SkillModel(skill: 'Espresso', percentage: 80),
  SkillModel(skill: 'Robolectric', percentage: 80),
  SkillModel(skill: 'Mockito', percentage: 80),
  SkillModel(skill: 'Appium', percentage: 75),
];
