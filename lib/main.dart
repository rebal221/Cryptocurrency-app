import 'package:flutter/material.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'components/auth_provider.dart';
import 'localization/locale_constant.dart';
import 'localization/localizations_delegate.dart';
import 'routes.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login.dart';
import 'utils/user_provider.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  AuthProvider().get_price();
  runApp(const MyApp());
}

Color _primaryColor = Color.fromRGBO(15, 148, 97, 1);
Color _accentColor = Colors.amber;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => MenuController()),
        // ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: _primaryColor,
          accentColor: _accentColor,
          // scaffoldBackgroundColor: Colors.grey.shade100,
          // primarySwatch: Colors.grey,
        ),
        initialRoute: HomeScreen.routeName,
        title: 'SHAMINIG',
        locale: _locale,
        home: HomeScreen(),

        debugShowCheckedModeBanner: false,
        routes: routes,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        },
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [
          const Locale('en', ''),
          const Locale('es', ''),
          const Locale('fr', ''),
          const Locale('zh', ''),
          const Locale('pt', ''),
          const Locale('ar', '')
        ],
        // ignore: prefer_const_literals_to_create_immutables
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }
}
