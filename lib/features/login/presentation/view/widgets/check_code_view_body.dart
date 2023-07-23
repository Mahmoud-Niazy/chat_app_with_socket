import 'package:chat_app/core/utils/words.dart';
import 'package:chat_app/features/login/presentation/view/widgets/background_container_with_primary_color.dart';
import 'package:chat_app/features/login/presentation/view/widgets/pin_code.dart';
import 'package:chat_app/features/login/presentation/view/widgets/white_container_with_widget.dart';
import 'package:flutter/material.dart';


class CheckCodeViewBody extends StatelessWidget {
  final codeController = TextEditingController();
  final String? phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CheckCodeViewBody({
    this.phone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        const BackgroundContainerWithPrimaryColor(
          text: WordsManager.pleaseEnterTheCode,
        ),

        WhiteContainerWithWidget(
          child: Center(
            child: PinCode(
              codeController: codeController,
              phone: phone,
            ),
          ),
        ),
      ],
    );
  }
}
