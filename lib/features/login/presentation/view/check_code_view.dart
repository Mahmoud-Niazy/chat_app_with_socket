import 'package:chat_app/features/login/presentation/view/widgets/check_code_view_body.dart';
import 'package:flutter/material.dart';

class CheckCodeView extends StatelessWidget{
  final String? phone ;

   CheckCodeView({super.key, this.phone});

  @override
  Widget build(BuildContext context) {
    final recievedData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CheckCodeViewBody(
        phone: recievedData['phone'],
      ),
    );
  }
}
