import 'package:authenticate/controller/register_bloc/register_bloc.dart';
import 'package:authenticate/controller/register_bloc/register_bloc_events.dart';
import 'package:authenticate/controller/register_bloc/register_bloc_states.dart';
import 'package:authenticate/views/signin_view.dart';
import 'package:authenticate/widgets/input_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  static const String name = '/siginUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: context.read<RegisterBloc>(),
        builder: (context, state) {
          if (state is RegisterBlocInitialState) {
            return const RegisterWidget();
          } else {
            if (state is RegisterBlocLoadingState) {
              return const RegisterLoadingWidget();
            } else if (state is RegisterBlocLoadedState) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacementNamed(context, SignInView.name);
              });
              return const SizedBox();
            } else {
              context
                  .read<RegisterBloc>()
                  .add(RegisterBlocRefereshStateEvent());
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      (state as RegisterBlocErrorState).errorMsg.toString(),
                    ),
                  ),
                );
              });
              return const SizedBox();
            }
          }
        },
      ),
    );
  }
}

class RegisterLoadingWidget extends StatelessWidget {
  const RegisterLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
