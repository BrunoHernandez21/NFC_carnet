part of 'shaderpreferences_bloc.dart';

class ShaderpreferencesState {
  ShaderpreferencesState({
    required this.isDarkTheme,
    required this.locale,
  });

  final bool isDarkTheme;
  final String locale;

  ShaderpreferencesState copyWith({
    bool? isDarkTheme,
    String? locale,
  }) =>
      ShaderpreferencesState(
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
        locale: locale ?? this.locale,
      );

  factory ShaderpreferencesState.fromJson(String str) =>
      ShaderpreferencesState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShaderpreferencesState.fromMap(Map<String, dynamic> json) =>
      ShaderpreferencesState(
        isDarkTheme: json["isDarkTheme"],
        locale: json["idioma"],
      );

  Map<String, dynamic> toMap() => {
        "isDarkTheme": isDarkTheme,
        "idioma": locale,
      };
}
