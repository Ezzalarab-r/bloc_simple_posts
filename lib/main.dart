import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/app_localizations.dart';
import 'bloc/counter/counter_bloc.dart';
import 'bloc/locale/locale_bloc.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LocaleBloc()..add(GetSavedLanguageEvent())),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          Locale? locale;
          if (state is ChangeLocaleState) {
            locale = state.locale;
          }
          return MaterialApp(
            locale: locale,
            supportedLocales: const [
              Locale('ar'), // Arabic
              Locale('en'), // English
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var l in supportedLocales) {
                if (locale != null && locale.languageCode == l.languageCode) {
                  return locale;
                }
              }
              return supportedLocales.first;
            },
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
