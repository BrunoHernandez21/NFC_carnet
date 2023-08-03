part of 'home_bloc.dart';

class HomeState {
  final String amount;
  final String carnetID;
  final String response;
  final String error;
  final String state;

  HomeState({
    required this.amount,
    required this.carnetID,
    required this.response,
    required this.error,
    required this.state,
  });

  HomeState copyWith({
      String? amount,
      String? carnetID,
      String? response,
      String? error,
      String? state,
      }) =>
      HomeState(
        amount: amount ?? this.amount,
        carnetID: carnetID ?? this.carnetID,
        response: amount ?? this.response,
        error: error ?? this.error,
        state: state ?? this.state,
      );  

}

