part of 'locale_bloc.dart';

abstract class LocaleEvent {}

class GetSavedLanguageEvent extends LocaleEvent {}

class ChangeLanguageEvent extends LocaleEvent {
  final String languageCode;
  ChangeLanguageEvent({required this.languageCode});
}
