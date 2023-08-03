import 'package:flutter/material.dart';
import 'package:nfc_app/src/shared_widgets/text.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
     return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TheamText.tituloMAX( texto: "Esperando respuesta"),
        )),
        const Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}