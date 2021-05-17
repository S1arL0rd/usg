// Packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:usg/translations.dart';

// Pages

import 'components/screens/constants.dart';
import 'components/screens/welcome_screen/welcome_screen.dart';
import 'components/screens/login/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final introdata = GetStorage();
  @override
  void initState() {
    super.initState();
    introdata.writeIfNull("displayed", false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Universty Student Guide',
      theme: ThemeData(
        primaryColor: uprimary,
        fontFamily: 'Vexa',
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenView(
        navigateRoute:
            introdata.read('displayed') ? LoginPage() : WelcomeScreen(),
        duration: 3000,
        imageSize: 400,
        imageSrc: "assets/images/logo.png",
        backgroundColor: Colors.white,
      ),
      translations: Translation(),
      locale: Locale('ar'),
      fallbackLocale: Locale('ar'),
    );
  }
}
