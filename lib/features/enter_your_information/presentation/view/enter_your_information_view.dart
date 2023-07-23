import 'package:chat_app/features/enter_your_information/presentation/view/widgets/enter_your_information_view_body.dart';
import 'package:flutter/material.dart';

class EnterYourInformationView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final recievedData = ModalRoute.of(context)!.settings.arguments as Map ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: EnterYourInformationViewBody(uId: recievedData['uId'],phone : recievedData['phone'],),
    );
  }
}