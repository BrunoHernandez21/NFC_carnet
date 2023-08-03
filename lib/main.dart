import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nfc_app/generated/l10n.dart';
import 'package:nfc_app/src/core/bloc/shaderPreferences/shaderpreferences_bloc.dart';
import 'package:nfc_app/src/core/definitions/theme.dart';
import 'package:nfc_app/src/pages/home/home_page.dart';
import 'package:nfc_app/src/pages/routes_screens.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final stateShader = await ShaderpreferencesBloc.loadShaderLocale();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Appstate(
      stateShader: stateShader,
    ));
  });
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive).then((value) {});
}

class Appstate extends StatelessWidget {
  final ShaderpreferencesState stateShader;
  const Appstate({
    Key? key,
    required this.stateShader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShaderpreferencesBloc(shaderPreferences: stateShader)),
      ],
      child: BlocBuilder<ShaderpreferencesBloc, ShaderpreferencesState>(
        builder: (context, state) {
          return MyApp(
            locale: state.locale,
            theme: AppThemeData.getTheme(state.isDarkTheme),
          );
        },
      ),
    );
  }
}

// asdas
class MyApp extends StatelessWidget {
  final ThemeData theme;
  final String locale;

  const MyApp({
    Key? key,
    required this.theme,
    required this.locale,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC Wallet',
      debugShowCheckedModeBanner: false,
      theme: theme,
      locale: Locale(locale),
      routes: Ruts.ruts,
      initialRoute: HomePage.rutePage,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalisations.delegate
      ],
      supportedLocales: const <Locale>[Locale("es","MX"),Locale("en","US")],
    );
  }
}


