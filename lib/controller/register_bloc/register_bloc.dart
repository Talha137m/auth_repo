import 'package:authenticate/controller/auth_behaviour.dart';
import 'package:authenticate/controller/register_bloc/register_bloc_events.dart';
import 'package:authenticate/controller/register_bloc/register_bloc_states.dart';
import 'package:authenticate/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterBlocEvents, RegisterBlocStates> {
  RegisterBloc() : super(RegisterBlocInitialState()) {
    on<RegisterBlocInitialEvent>((event, emit) async {
      emit.call(RegisterBlocLoadingState());
      try {
        UserRegisterService userRegisterService = UserRegisterService();
        User? user = await userRegisterService.userRegister(
            authModel: event.authRegisterModel);
        if (user != null) {
          emit.call(RegisterBlocLoadedState(isRegister: user));
        } else {
          emit.call(RegisterBlocErrorState(errorMsg: 'the email not exist'));
        }
      } on FirebaseAuthException catch (e) {
        var msg = handleAuthException(e.code);
        emit(RegisterBlocErrorState(errorMsg: msg));
      } on FirebaseException catch (e) {
        emit.call(RegisterBlocErrorState(errorMsg: e.code.toString()));
      } catch (e) {
        emit.call(RegisterBlocErrorState(errorMsg: 'something wet wrong'));
      }
    });
    on<RegisterBlocRefereshStateEvent>((event, emit) {
      emit(RegisterBlocInitialState());
    });
  }
}
