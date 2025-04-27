## Introduction
Welcome to the portfolio wiki! This Flutter-based project provides a customizable and responsive portfolio solution for developers. Showcase your skills, projects, and experience with a visually appealing and easily deployable web and Android application. Dive in to learn how to set up, customize, and deploy your own stunning portfolio!

## Description
The portfolio repository offers a readily available portfolio template built using Flutter 2.0. It's designed to be responsive, ensuring optimal viewing across various devices, and is deployable as both a web application and an Android app. The core purpose is to provide developers with a quick and easy way to create and host their online portfolio, highlighting their projects, skills, and contact information. Key functionalities include:

- Project Showcase: Display your projects with descriptions, images, and links.
- Skill Presentation: Effectively present your technical skills and expertise.
- Contact Information: Provide easy access to your contact details and social media profiles.
- Theming: Supports light and dark themes.
- Responsiveness: Adapts to different screen sizes for optimal viewing.

## Architecture
The portfolio application follows a modular architecture, leveraging Flutter's widget-based structure. Here's a high-level overview of the core components:

- lib/main.dart: The entry point of the application, responsible for initializing the Flutter environment, setting up routing, and defining the overall app structure. It utilizes MultiProvider to provide ThemeProvider to the entire application.
- lib/constants.dart: Defines constants such as colors, social media links, project details, and contact information. This file centralizes configuration and data used throughout the application.
- lib/sections: Contains the different sections of the portfolio, such as the main section, service details, and contact form. Each section is implemented as a separate widget or a collection of widgets.
    - MainSection: The primary landing page section, likely showcasing a brief introduction and key highlights.
    - ServiceDetails: Displays detailed information about the services offered.
    - GetInTouch: A contact form or section facilitating user interaction.
- lib/provider: Manages application state, particularly the theme.
    - ThemeProvider: A ChangeNotifier that handles theme changes (light/dark mode) and persists the user's preference.
- lib/widget: Contains reusable widgets used throughout the application.
- lib/generated: Contains generated code, such as assets.
- Dependencies: The project utilizes various Flutter packages, including:
    - google_fonts: For using custom fonts.
    - url_launcher: For opening URLs in the browser.
    - responsive_builder: For building responsive layouts.
    - carousel_slider: For creating image carousels.
    - animated_text_kit: For adding animated text effects.
    - font_awesome_flutter: For using Font Awesome icons.
    - provider: For state management.

The application uses a routing mechanism to navigate between different sections, as defined in MaterialApp's routes property in lib/main.dart.

## Usage Instructions
Follow these steps to install, configure, and run the portfolio application:

 1. Prerequisites: Ensure you have Flutter 2.0 or higher installed on your system.
 2. Clone the Repository:
    ```bash
    git clone https://github.com/mhmzdev/DevFolio
    cd DevFolio
    ```
 3. Install Dependencies:
    ```bash
    flutter pub get
    ```
 4. Enable Web Support (if needed):
    ```bash
    flutter config --enable-web
    ```
 5. Run the Application:
    - For Web:
    ```bash
    flutter run -d chrome
    ```
    - For Android (ensure you have an emulator or connected device):
    ```bash
    flutter run
    ```
    6. Configuration:
        - Modify the constants in lib/constants.dart to reflect your personal information, social media links, project details, and contact information.
        - Customize the UI by modifying the widgets in the lib/sections directory.
        - Add or modify assets (images, fonts) in the assets directory and update the pubspec.yaml file accordingly.
    7. Deployment:
        - Web: Use flutter build web to generate the web build, then deploy the contents of the build/web directory to a web server.
        - Android: Use flutter build apk or flutter build appbundle to generate the Android build, then deploy the APK or app bundle to the Google Play Store.