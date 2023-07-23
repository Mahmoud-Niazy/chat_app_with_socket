import 'package:chat_app/core/functions/navigation.dart';
import 'package:chat_app/core/utils/routes.dart';
import 'package:chat_app/features/chats/presentation/view/chats_view.dart';
import 'package:chat_app/features/enter_your_information/presentation/view/enter_your_information_view.dart';
import 'package:chat_app/features/login/presentation/view_model/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/utils/colors.dart';
import '../../view_model/otp_cubit/otp_states.dart';

class PinCode extends StatelessWidget {
  final TextEditingController codeController;
  final String? phone;

  const PinCode({
    super.key,
    this.phone,
    required this.codeController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpStates>(
      listener: (context, state) async {
        if (state is OtpSuccessfullyState) {
          var cubit = OtpCubit.get(context);
          bool? isExist = await cubit.checkIfUserExistOrNot(
            phone: phone!,
          );
          if (isExist == false) {
            navigateAndFinish(
              context: context,
              page: EnterYourInformationView(),
              route: RoutesManager.enterYourInformation,
              argument: {
                'uId' : state.uId,
                'phone' : state.phone,
              },
            );
          }
          else{
            navigateAndFinish(
              context: context,
              page: const ChatsView(),
              route: RoutesManager.chatsView,
            );
          }
        }
      },
      builder: (context, state) {
        return PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            selectedFillColor: ColorsManager.primaryColor,
            selectedColor: ColorsManager.primaryColor,
            inactiveFillColor: ColorsManager.whiteColor,
            inactiveColor: ColorsManager.primaryColor,
            activeFillColor: ColorsManager.primaryColor,
            activeColor: ColorsManager.primaryColor,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: codeController,
          keyboardType: TextInputType.phone,
          onCompleted: (v) {
            print(v);
            OtpCubit.get(context).checkCode(smsCode: v);
          },
          validator: (value) {
            if (state is CodeErrorState) {
              return 'Code is incorrect';
            }
            return null;
          },
        );
      },
    );
  }
}
