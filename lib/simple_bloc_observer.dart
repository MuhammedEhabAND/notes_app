import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class SimpleBlocObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    debugPrint('close : $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {

    debugPrint('create : $bloc');
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
  
}