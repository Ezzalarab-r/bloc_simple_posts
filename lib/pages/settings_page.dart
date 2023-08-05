import 'package:bloc_simple_posts/app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/app_strings.dart';
import '../bloc/locale/locale_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings.tr(context)),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('العربية'),
            BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) {
                if (state is ChangeLocaleState) {
                  bool isEnglish = true;
                  isEnglish = state.locale.languageCode == 'en';
                  return Switch(
                    value: isEnglish,
                    onChanged: (v) {
                      context.read<LocaleBloc>().add(
                          ChangeLanguageEvent(languageCode: v ? 'en' : 'ar'));
                    },
                  );
                } else {
                  return Center(child: Text(state.runtimeType.toString()));
                }
              },
            ),
            const Text('English'),
          ],
        ),
      ),
    );
  }
}
