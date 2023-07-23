import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/features/login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.primaryColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginViewBody(),
        ),
      ),
    );
  }
}