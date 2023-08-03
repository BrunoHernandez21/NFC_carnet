import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nfc_app/src/core/definitions/storage_directories.dart';

part 'shaderpreferences_event.dart';
part 'shaderpreferences_state.dart';

class ShaderpreferencesBloc
    extends Bloc<ShaderpreferencesEvent, ShaderpreferencesState> {
  ShaderpreferencesBloc({required ShaderpreferencesState shaderPreferences}) : super(shaderPreferences) {
    on<OnChageLocaleEvent>((event, emit) {
      final newState = state.copyWith(locale: event.locale);
      _saveShaderLocale(newState);
      emit(newState);
    });
    on<OnChageThemeEvent>((event, emit) {
      final newState = state.copyWith(isDarkTheme: event.isDarkTheme);
      _saveShaderLocale(newState);
      emit(newState);
    });
  }

  Future<bool> onChagengeTheme() async {
    add(OnChageThemeEvent(isDarkTheme: !state.isDarkTheme));
    return true;
  }

  Future<bool> _saveShaderLocale(ShaderpreferencesState state) async {
    final LocalStorage storageConfiguration = LocalStorage(StorageDirectories.sistemConfigurations);
    while (! (await storageConfiguration.ready)){
      await Future.delayed(const Duration(microseconds: 100), () {});
    }
    return await storageConfiguration.setItem(StorageDirectories.sistemConfigurations, state.toJson()).then((value) => true) .onError((error, stackTrace) => false);
  }

  static Future<ShaderpreferencesState> loadShaderLocale() async {
    final LocalStorage storageConfiguration = LocalStorage(StorageDirectories.sistemConfigurations);
    final jsonPreferences = storageConfiguration.getItem(StorageDirectories.sistemConfigurations);
    if (jsonPreferences == null) {
      return ShaderpreferencesState(
        locale: "es",
        isDarkTheme: false, 
      );
    }
    try {
      return ShaderpreferencesState.fromJson(jsonPreferences);
    } catch (e) {
      return ShaderpreferencesState(
        locale: "es",
        isDarkTheme: false,
      );
    }
  }


}
