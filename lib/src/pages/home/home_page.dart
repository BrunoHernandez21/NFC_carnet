import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nfc_app/src/core/utils/permision.dart';
import 'package:nfc_app/src/pages/home/bloc/home/home_bloc.dart';
import 'package:nfc_app/src/pages/home/widgets/home_error.dart';
import 'package:nfc_app/src/pages/home/widgets/home_input_cash.dart';
import 'package:nfc_app/src/pages/home/widgets/home_loading.dart';
import 'package:nfc_app/src/pages/home/widgets/home_result.dart';
import 'package:nfc_app/src/pages/home/widgets/home_scan_nfc.dart';

class HomePage extends StatelessWidget {
  static const rutePage = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar( title: const Text("NFT"), centerTitle: true,),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) { 
            AppPermission.checkAll();
            switch(state.state) { 
              case "InitState": { 
                  return const HomeInputCash(); 
              } 
              case "SendAmount": { 
                  return const HomeScanNFC(); 
              } 
              case "CatchNFC": { 
                  return const HomeLoading(); 
              } 
              case "CatchSMS": { 
                  return const HomeResult();  
              }  
              case "errorState": { 
                  return const HomeError();  
              }   
              default: { 
                  return const HomeError();   
              }
            } 
          },
      ),
      ),  
    );
  }
}

