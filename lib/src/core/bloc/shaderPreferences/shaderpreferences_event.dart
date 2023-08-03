part of 'shaderpreferences_bloc.dart';

@immutable
abstract class ShaderpreferencesEvent {}

class OnChageLocaleEvent extends ShaderpreferencesEvent {
  final String locale;
  OnChageLocaleEvent({required this.locale});
}

class OnChageThemeEvent extends ShaderpreferencesEvent {
  final bool isDarkTheme;
  OnChageThemeEvent({required this.isDarkTheme});
}

