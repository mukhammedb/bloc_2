import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetLoastEvent>((event, emit) => emit(InternetLoastState()));
    on<InternetGainetdEvent>((event, emit) => emit(InternetGainetdState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainetdEvent());
      }
      else {
        add(InternetLoastEvent());
      }
     });

     @override 
     Future<void> close(){
       connectivitySubscription?.cancel();
       return super.close();
     }
  }
}
