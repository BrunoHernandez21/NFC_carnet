part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class OnSendAmount extends HomeEvent {
  final String amount;
  OnSendAmount({required this.amount});
}
class OnCatchNFC extends HomeEvent {
  final String carnetID;
  OnCatchNFC({required this.carnetID});
}
class OnCatchSms extends HomeEvent {
  final String response;
  OnCatchSms({required this.response});
}

class OnLoading extends HomeEvent {}
class OnInitState extends HomeEvent {}
class OnError extends HomeEvent {
  final String error;
  OnError({required this.error});
}