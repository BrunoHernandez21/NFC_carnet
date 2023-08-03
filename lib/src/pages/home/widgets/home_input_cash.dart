import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_app/src/pages/home/bloc/home/home_bloc.dart';
import 'package:nfc_app/src/shared_widgets/inputs_text.dart';
import 'package:nfc_app/src/shared_widgets/text.dart';

class HomeInputCash extends StatefulWidget {

  const HomeInputCash({super.key});

  @override
  State<HomeInputCash> createState() => _HomeInputCashState();
}

class _HomeInputCashState extends State<HomeInputCash> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TheamText.tituloMAX( texto: "Ingrese el monto"),
        )),
        SizedBox(
          width: 300,
          child: InputsText.classic(
            controller: textEditingController,
            textType: TextInputType.number,
            onEditingComplete: () {
              context.read<HomeBloc>().sendAmount(textEditingController.text);
            } 
          ),
        )
      ],
    );  
  }
}