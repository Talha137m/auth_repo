import 'package:authenticate/models/auth_register_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class RegisterBlocEvents {}

@immutable
class RegisterBlocInitialEvent extends RegisterBlocEvents {
  final AuthRegisterModel authRegisterModel;
  RegisterBlocInitialEvent({required this.authRegisterModel});
}

@immutable
class RegisterBlocRefereshStateEvent extends RegisterBlocEvents {}
