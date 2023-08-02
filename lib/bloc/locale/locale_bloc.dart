import 'package:bloc_simple_posts/shared/language_cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleInitial()) {
    on<LocaleEvent>((event, emit) async {
      if (event is GetSavedLanguageEvent) {
        final String cachedLanguage =
            await LanguageCacheHelper().getCachedLanguageCode();
        emit(ChangeLocaleState(locale: Locale(cachedLanguage)));
      } else if (event is ChangeLanguageEvent) {
        String languageCode = event.languageCode;
        await LanguageCacheHelper().cacheLanguageCode(languageCode);
        emit(ChangeLocaleState(locale: Locale(languageCode)));
      }
    });
  }
}
