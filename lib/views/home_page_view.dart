import 'package:authenticate/views/siginup_view.dart';
import 'package:authenticate/views/signin_view.dart';
import 'package:flutter/material.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});
  static const String name = '/';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignupPage.name);
                },
                child: Container(
                  width: width * 0.9,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Register user',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignInView.name);
                },
                child: Container(
                  width: width * 0.9,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Sign in user',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
