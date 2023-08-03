
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:background_sms/background_sms.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:nfc_app/src/core/definitions/enviroments.dart';
import 'package:nfc_app/src/core/utils/auto_fill_sms.dart';
import 'package:nfc_app/src/core/utils/nfc.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  
  HomeBloc() : super(HomeState(carnetID: "", amount: "0", error: "", response: "",state: "InitState")) {
    on<OnInitState>((event, emit) {
      emit( HomeState(carnetID: "", amount: "0", error: "", response: "",state: "InitState"));
    });
    on<OnSendAmount>((event, emit) {
      emit( HomeState(carnetID: "", amount: event.amount, error: "", response: "",state: "SendAmount"));
    });
    on<OnCatchNFC>((event, emit) {
      emit( HomeState(carnetID: event.carnetID, amount: state.amount, error: "", response: "",state: "CatchNFC"));
    });
    on<OnCatchSms>((event, emit) {
      emit( HomeState(carnetID: state.carnetID, amount: state.amount, error: "", response: event.response,state: "CatchSMS"));
    });
    on<OnError>((event, emit) {
      emit( HomeState(carnetID: "", amount: "0", error: "", response: "",state: "errorState"));
    });
  }

  goToInitState(){
    add(OnInitState());
  }
  sendAmount(String amount ){
    add(OnSendAmount(amount: amount));

    UtilsNFC.searchNFC().then((resp) {
      if (resp == null){
        add(OnError(error: "error"));
      } else {
        catchNFC(resp);
      }
    });
  }
  catchNFC(String carnetID ){
    add(OnCatchNFC(carnetID: carnetID));
    
    BackgroundSms
    .sendMessage(phoneNumber: Enviroments.numberPhone, message: '$carnetID:${state.amount}')
    .then((result) => { if (result == SmsStatus.failed) add(OnError(error: "Error send Message")) });
  }

  listenerSMS(){
    AutoFillSMS.listenerSMS().then((value) {
      if(value != null){
        add(OnCatchSms(response: value.split(":").last));
      } else {
        add(OnError(error: "error"));
      }
    });
  }
  
}

