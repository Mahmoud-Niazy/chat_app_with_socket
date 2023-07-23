import 'package:chat_app/core/functions/navigation.dart';
import 'package:chat_app/core/utils/routes.dart';
import 'package:chat_app/core/widgets/button.dart';
import 'package:chat_app/core/widgets/text_form_field.dart';
import 'package:chat_app/features/login/presentation/view/check_code_view.dart';
import 'package:chat_app/features/login/presentation/view/widgets/background_container_with_primary_color.dart';
import 'package:chat_app/features/login/presentation/view/widgets/white_container_with_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/otp_cubit/otp_cubit.dart';
import '../../view_model/otp_cubit/otp_states.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundContainerWithPrimaryColor(text: 'Login'),
        WhiteContainerWithWidget(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: phoneController,
                      inputType: TextInputType.phone,
                      label: 'Your Phone',
                      prefixIcon: Icons.phone_android,
                      borderRadius: 20,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone is empty';
                        }
                        if (value.length != 11) {
                          return 'Phone must be 11 numbers';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocConsumer<OtpCubit, OtpStates>(
                      listener: (context, state) {
                        if (state is PhoneCorrectState) {
                          navigateAndFinish(
                              context: context,
                              page: CheckCodeView(),
                              route: RoutesManager.checkCodeView,
                              argument: {
                                'phone': phoneController.text,
                              });
                        }
                        print(state);
                      },
                      builder: (context, state) {
                        if (state is OtpLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return CustomButton(
                            label: 'Login',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                OtpCubit.get(context)
                                    .phoneAuth(phoneNumber: phoneController.text);
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//
