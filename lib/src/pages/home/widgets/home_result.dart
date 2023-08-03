import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_app/src/pages/home/bloc/home/home_bloc.dart';
import 'package:nfc_app/src/shared_widgets/text.dart';

class HomeResult
 extends StatelessWidget {
  const HomeResult({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Timer( const Duration(seconds: 5), () { context.read<HomeBloc>().goToInitState(); });
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TheamText.tituloMAX( texto: state.response),
            )),
          ],
        );
      },
    );
  }
}