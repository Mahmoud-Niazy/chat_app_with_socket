import 'package:flutter/cupertino.dart';

class PageTransition extends PageRouteBuilder{
  late Widget page ;
  late String route ;
  Map? argument ;

  PageTransition({
    required this.page ,
    required this.route ,
    this.argument,
}) : super(
    settings: RouteSettings(
      name: route,
      arguments: argument,
    ),
    pageBuilder: (context,animation1,animation2){
      return page ;
    },
    transitionsBuilder: (context,animation1,animation2,child){
      return SlideTransition(position: animation1.drive(
          Tween<Offset>(
        begin: const Offset(-1,0),
        end: const Offset(0,0),
      ),
      ),
        child: child,
      );
  }
  );
}