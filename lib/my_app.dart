import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:flutter_folders_structure/l10n/l10n.dart';
import 'package:flutter_folders_structure/l10n/local_provider.dart';
import 'package:flutter_folders_structure/my_home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: LocaleProvider().localeNotifier,
        builder: (context, locale, child) {
          return MaterialApp(
            title: 'Flutter folders structure',
            locale: locale,
            supportedLocales: L10n.all,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              useMaterial3: true,
            ),
            home: Builder(builder: (context) {
              return MyHomePage(title: context.translate.appName);
            }),
          );
        });
  }
}
