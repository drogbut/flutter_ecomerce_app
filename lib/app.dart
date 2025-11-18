import 'package:flutter/material.dart';

import 'features/app/cubit/auth_cubit.dart';
import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'routing/app_router.dart';
import 'utilities/theme/theme.dart';

class App extends StatelessWidget {
  final AuthenticationCubit authCubit;
  const App({super.key, required this.authCubit});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'DREAM TEAM',
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.all,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        themeMode: ThemeMode.light,
        theme: DTheme.lightTheme,
        darkTheme: DTheme.darkTheme,
        routerConfig: AppRouter.router(authCubit));
  }
}
