import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_can/controllers/user_controller.dart';
import 'package:i_can/l10n/localization.dart';
import 'package:i_can/screens/home_screen.dart';
import 'package:i_can/screens/on_boarding_1.dart';
import 'package:i_can/screens/on_boarding_2.dart';
import 'package:i_can/screens/on_boarding_3.dart';
import 'package:i_can/screens/on_boarding_4.dart';
import 'package:i_can/screens/on_boarding_5.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(MyApp(prefs: prefs)),
  );
}

class MyApp extends StatefulWidget {
  final SharedPreferences? prefs;

  const MyApp({super.key, this.prefs});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isOnboarded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getOnBoardingStatus();
    });
  }

  void getOnBoardingStatus() async {
    bool? status = widget.prefs!.getBool('isOnboarded');
    if (status == null || !status) {
      isOnboarded = false;
    } else {
      isOnboarded = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I Can',
      theme: ThemeData(
        textTheme: GoogleFonts.acmeTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF1F2120),
        cardColor: const Color(0xff313433),
        focusColor: const Color(0xff636866),
      ),
      getPages: [
        GetPage(name: OnBoardingOne.routeName, page: () => OnBoardingOne()),
        GetPage(name: OnBoardingTwo.routeName, page: () => OnBoardingTwo()),
        GetPage(name: OnBoardingThree.routeName, page: () => OnBoardingThree()),
        GetPage(name: OnBoardingFour.routeName, page: () => OnBoardingFour()),
        GetPage(
          name: OnBoardingFive.routeName,
          page: () => OnBoardingFive(
            prefs: widget.prefs!,
          ),
        ),
      ],
      localizationsDelegates: const [
        QuitSmokeLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      home: isOnboarded ? const HomeScreen() : OnBoardingOne(),
    );
  }
}
