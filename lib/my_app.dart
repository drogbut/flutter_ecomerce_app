import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/Themes/dark/dark.dart';
import 'package:flutter_folders_structure/core/Themes/dark/high_constrast.dart';
import 'package:flutter_folders_structure/core/Themes/light/high_constrast.dart';
import 'package:flutter_folders_structure/core/Themes/light/light.dart';
import 'package:flutter_folders_structure/l10n/l10n.dart';
import 'package:flutter_folders_structure/l10n/local_provider.dart';
import 'package:flutter_folders_structure/modules/splash_page/splash_page.dart';
import 'package:flutter_folders_structure/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return ValueListenableBuilder(
              valueListenable: LocaleProvider().localeNotifier,
              builder: (context, locale, child) {
                return MaterialApp(
                  title: 'Flutter folders structure',
                  debugShowCheckedModeBanner: false,
                  locale: locale,
                  supportedLocales: L10n.all,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  themeMode: themeProvider.themeMode,
                  theme: ThemesLight.lightTheme,
                  highContrastTheme:
                      ThemeLightHighContrast.lightHighContrastTheme,
                  darkTheme: ThemesDark.darkTheme,
                  highContrastDarkTheme:
                      ThemesDarkHighContrast.darkHighContrastTheme,
                  home: Builder(builder: (context) {
                    return SplashPage();
                  }),
                );
              });
        });
  }
}
