import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class RegisterBlocStates {}

@immutable
class RegisterBlocInitialState extends RegisterBlocStates {}

@immutable
class RegisterBlocLoadingState extends RegisterBlocStates {}

@immutable
class RegisterBlocLoadedState extends RegisterBlocStates {
  final User isRegister;
  RegisterBlocLoadedState({required this.isRegister});
}

@immutable
class RegisterBlocErrorState extends RegisterBlocStates {
  final String errorMsg;
  RegisterBlocErrorState({required this.errorMsg});
}
