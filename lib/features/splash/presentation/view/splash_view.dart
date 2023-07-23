import 'package:chat_app/core/functions/navigation.dart';
import 'package:chat_app/core/utils/durations.dart';
import 'package:chat_app/core/utils/routes.dart';
import 'package:chat_app/features/login/presentation/view/login_view.dart';
import 'package:chat_app/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      DurationsManager.splashDuration,
      () {
        navigateAndFinish(context: context, page: const LoginView(), route: RoutesManager.loginView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
