import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../login/login_page.dart';
import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final introdata = GetStorage();

  void endIntro(context) {
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage()));
    introdata.write("displayed", true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IntroductionScreen(
        showDoneButton: true,
        showSkipButton: true,
        showNextButton: true,
        next: Text('التالي'),
        skip: Text('تخطي'),
        done: Text('أبدأ'),
        onDone: () {
          endIntro(context);
        },
        onSkip: () {
          endIntro(context);
        },
        curve: Curves.easeOut,
        pages: [
          PageViewModel(
            title: "مرحبا",
            body: "احصل علي دراسة جامعية اسهل وافضل بطريقتك الخاصة",
            image: Center(
                child: SvgPicture.asset(
                    'assets/icons/undraw_Graduation_re_gthn.svg')),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                    color: uprimary, fontSize: 24, fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 20.0, height: 1.5),
                imagePadding: EdgeInsets.only(
                    top: size.height * 0.15,
                    right: size.width * 0.05,
                    left: size.width * 0.05),
                descriptionPadding: EdgeInsets.only(top: size.height * 0.02),
                titlePadding: EdgeInsets.only(top: size.height * 0.1)),
          ),
          PageViewModel(
            title: "نظم ادواتك",
            body: "قم بتنظيم الكتب الالكترونية والمذكرات بطريقة سهلة",
            image: Center(
                child: SvgPicture.asset('assets/icons/undraw_Books_l33t.svg')),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                    color: uprimary, fontSize: 24, fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 20.0, height: 1.5),
                imagePadding: EdgeInsets.only(
                    top: size.height * 0.15,
                    right: size.width * 0.05,
                    left: size.width * 0.05),
                descriptionPadding: EdgeInsets.only(top: size.height * 0.02),
                titlePadding: EdgeInsets.only(top: size.height * 0.1)),
          ),
          PageViewModel(
            title: "ضع خطة لك",
            body: "ضع خطة للمذاكرة تناسبك بكل سهولة للمذاكرة بفاعلية اكبر",
            image: Center(
                child: SvgPicture.asset(
                    'assets/icons/undraw_Master_plan_re_jvit.svg')),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                    color: uprimary, fontSize: 24, fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 20.0, height: 1.5),
                imagePadding: EdgeInsets.only(
                    top: size.height * 0.15,
                    right: size.width * 0.05,
                    left: size.width * 0.05),
                descriptionPadding: EdgeInsets.only(top: size.height * 0.02),
                titlePadding: EdgeInsets.only(top: size.height * 0.1)),
          ),
          PageViewModel(
            title: "كن دائما متصل",
            body:
                "احصل علي التنبيهات والمواعيد الخاصة بك للمذاكرة , التسليمات والامتحانات",
            image: Center(
                child:
                    SvgPicture.asset('assets/icons/undraw_education_f8ru.svg')),
            decoration: PageDecoration(
                titleTextStyle: TextStyle(
                    color: uprimary, fontSize: 24, fontWeight: FontWeight.bold),
                bodyTextStyle: TextStyle(fontSize: 20.0, height: 1.5),
                imagePadding: EdgeInsets.only(
                    top: size.height * 0.15,
                    right: size.width * 0.05,
                    left: size.width * 0.05),
                descriptionPadding: EdgeInsets.only(top: size.height * 0.02),
                titlePadding: EdgeInsets.only(top: size.height * 0.1)),
          ),
        ],
      ),
    );
  }
}
