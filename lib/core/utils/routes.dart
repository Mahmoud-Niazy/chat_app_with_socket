import 'package:chat_app/features/enter_your_information/presentation/view/enter_your_information_view.dart';
import 'package:chat_app/features/login/presentation/view/check_code_view.dart';
import 'package:chat_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import '../../features/chats/presentation/view/chats_view.dart';
import '../../features/login/presentation/view/login_view.dart';

abstract class RoutesManager {
  static const String splashRoute = '/' ;
  static const String loginView = 'loginView' ;
  static const String checkCodeView = 'checkCodeView' ;
  static const String chatsView = 'ChatsView' ;
  static const String enterYourInformation = 'EnterYourInformation' ;



  static Map<String,Widget Function(BuildContext)> routes = {
    splashRoute : (context)=> const SplashView(),
    loginView : (context)=> const LoginView(),
    checkCodeView : (context)=>  CheckCodeView(),
    chatsView : (context)=>  ChatsView(),
    enterYourInformation : (context)=>  EnterYourInformationView(),



  };
}