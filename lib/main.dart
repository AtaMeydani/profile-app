import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:profile_project/theme_config.dart';

import 'consts.dart';
import 'home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  Language _language = Language.en;

  Locale getLocale() {
    switch (_language) {
      case Language.en:
        return const Locale('en');
      case Language.fa:
        return const Locale('fa');
      default:
        return const Locale('en');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Projects",
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: getLocale(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark) {
              _themeMode = ThemeMode.light;
            } else {
              _themeMode = ThemeMode.dark;
            }
          });
        },
        toggleLanguage: (Language selectedLanguage) {
          setState(() {
            _language = selectedLanguage;
          });
        },
      ),
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme(_language)
          : MyAppThemeConfig.light().getTheme(_language),
    );
  }
}
