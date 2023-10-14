import 'package:authenticate/views/home_page_view.dart';
import 'package:authenticate/views/siginup_view.dart';
import 'package:authenticate/views/signin_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomepageView.name:
      return AnimatedRoutes(
        setting: settings,
        child: const HomepageView(),
      );
    case SignupPage.name:
      return AnimatedRoutes(
        setting: settings,
        child: const SignupPage(),
      );
    case SignInView.name:
      return AnimatedRoutes(
        setting: settings,
        child: const SignInView(),
      );
    default:
      return AnimatedRoutes(
        setting: settings,
        child: const PageErrorWidget(),
      );
  }
}

class PageErrorWidget extends StatelessWidget {
  const PageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Text('404:page not found'),
    );
  }
}

///make the animated transition widget
class AnimatedRoutes extends PageRouteBuilder {
  final Widget child;
  final RouteSettings? setting;
  static Tween<Offset> tween =
      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);

  AnimatedRoutes({required this.child, this.setting})
      : super(
            transitionDuration: const Duration(milliseconds: 800),
            reverseTransitionDuration: const Duration(milliseconds: 800),
            settings: setting,
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: tween.animate(animation),
                child: child,
              );
            });
}
