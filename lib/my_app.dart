import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/Themes/dark/dark.dart';
import 'core/Themes/dark/high_constrast.dart';
import 'core/Themes/light/high_constrast.dart';
import 'core/Themes/light/light.dart';
import 'core/extensions/widget.dart';
import 'l10n/l10n.dart';
import 'l10n/local_provider.dart';
import 'modules/authentication/domain/enums/app_state.dart';
import 'modules/authentication/presenter/providers/auth_provider/authentication_provider.dart';
import 'modules/authentication/presenter/ui/sign_in.dart';
import 'modules/authentication/presenter/ui/splash_page.dart';
import 'theme/theme_provider.dart';
import 'ui/my_listenables/double_value_listenable.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyDoubledValueListenableBuilder(
        firstListenable: ThemeProvider().themeModeNotifier,
        secondListenable: LocaleProvider().localeNotifier,
        builder: (_, themeMode, locale, __) {
          return MaterialApp(
            title: 'Flutter folders structure',
            debugShowCheckedModeBanner: false,
            locale: locale,
            supportedLocales: L10n.all,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            themeMode: themeMode,
            theme: ThemesLight.lightTheme,
            highContrastTheme: ThemeLightHighContrast.lightHighContrastTheme,
            darkTheme: ThemesDark.darkTheme,
            highContrastDarkTheme: ThemesDarkHighContrast.darkHighContrastTheme,
            home: Builder(builder: (context) {
              return ValueListenableBuilder(
                  valueListenable: AuthenticationProvider().authStateNotifier,
                  builder: (_, state, __) {
                    switch (state) {
                      case AuthState.unauthenticated:
                        return SignInPage();
                      case AuthState.authenticated:
                        return const Scaffold();
                      case AuthState.displaySplash:
                        return const SplashPage();
                      default:
                        return 0.sbs;
                    }
                  });
            }),
          );
        });
  }
}
