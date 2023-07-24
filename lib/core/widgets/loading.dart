// import 'package:chat_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        // valueColor: new  AlwaysStoppedAnimation<Color>(ColorsManager.primaryColor),
      ),
    );
  }
}
