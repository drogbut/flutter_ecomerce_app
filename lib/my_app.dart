import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/Themes/dark/dark.dart';
import 'core/Themes/dark/high_constrast.dart';
import 'core/Themes/light/high_constrast.dart';
import 'core/Themes/light/light.dart';
import 'l10n/l10n.dart';
import 'l10n/local_provider.dart';
import 'modules/splash/presenter/providers/splash_cubit.dart';
import 'modules/splash/presenter/ui/splash_page.dart';
import 'theme/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStarted()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale?>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
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
                home: const SplashPage(),
              );
            },
          );
        },
      ),
    );
  }
}
