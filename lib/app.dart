import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'l10n/l10n.dart';
import 'l10n/local_provider.dart';
import 'theme/theme_provider.dart';
import 'utilities/theme/theme.dart';
import 'widgets/loaders/loading_indicator.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LocaleCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale?>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return GetMaterialApp(
                title: 'e_commerce App',
                debugShowCheckedModeBanner: false,
                locale: locale,
                supportedLocales: L10n.all,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                themeMode: themeMode,
                theme: DTheme.lightTheme,
                darkTheme: DTheme.darkTheme,
                home: const LoadingIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
