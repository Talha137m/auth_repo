import 'dart:math';
import 'package:authenticate/controller/register_bloc/register_bloc.dart';
import 'package:authenticate/controller/register_bloc/register_bloc_events.dart';
import 'package:authenticate/models/auth_register_model.dart';
import 'package:authenticate/utils/constants.dart';
import 'package:authenticate/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late GlobalKey<FormState> globalKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  double elementOpacity = 1;
  double loadingBallSize = 1;
  @override
  void initState() {
    super.initState();
    globalKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    var minimum = min(width, height);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, height * 0.1, 0, 0),
            child: SizedBox(
              width: width * 0.2,
              height: height * 0.2,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Form(
            key: globalKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, height * 0.08, width * 0.4, 0),
                  child: Text(
                    'Welcome ,',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: minimum * 0.06,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, height * 0.02, width * 0.34, 0),
                  child: Text(
                    'Sign in to continue',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: minimum * 0.05,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: minimum * 0.1),
                    child: SizedBox(
                      width: width * 0.7,
                      child: MyTextFormField(
                        hintText: 'E_Mail',
                        focusNode: emailFocusNode,
                        textEditingController: emailController,
                        keyboardType: TextInputType.emailAddress,
                        area: minimum,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field should not emty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, height * 0.03, 0, 0),
                    child: SizedBox(
                      width: width * 0.7,
                      child: MyTextFormField(
                        hintText: 'Password',
                        focusNode: passwordFocusNode,
                        textEditingController: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        area: minimum,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field should not emty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.08),
                  child: Container(
                    width: width * 0.35,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          context.read<RegisterBloc>().add(
                              RegisterBlocInitialEvent(
                                  authRegisterModel: AuthRegisterModel(
                                      email: emailController.text,
                                      password: passwordController.text)));
                        }
                      },
                      child: Text(
                        'Get Started →',
                        style: TextStyle(
                            fontSize: minimum * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
