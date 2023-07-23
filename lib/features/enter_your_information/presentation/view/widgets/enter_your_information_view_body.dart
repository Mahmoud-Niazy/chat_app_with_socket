import 'package:chat_app/core/functions/navigation.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/routes.dart';
import 'package:chat_app/core/utils/words.dart';
import 'package:chat_app/core/widgets/button.dart';
import 'package:chat_app/core/widgets/loading.dart';
import 'package:chat_app/core/widgets/text_form_field.dart';
import 'package:chat_app/features/chats/presentation/view/chats_view.dart';
import 'package:chat_app/features/enter_your_information/presentation/view_model/enter_your_info_cubit/enter_your_info_states.dart';
import 'package:chat_app/features/login/presentation/view/widgets/background_container_with_primary_color.dart';
import 'package:chat_app/features/login/presentation/view/widgets/white_container_with_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/icon_button.dart';
import '../../view_model/enter_your_info_cubit/enter_your_info_cubit.dart';

class EnterYourInformationViewBody extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final String? uId ;
  final String? phone ;
  final formKey = GlobalKey<FormState>();

  EnterYourInformationViewBody({super.key, this.uId,this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterYourInformationCubit(),
      child: Stack(
        children: [
          const BackgroundContainerWithPrimaryColor(
              text: WordsManager.enterYourInformation),
          WhiteContainerWithWidget(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocConsumer<EnterYourInformationCubit, EnterYourInformationStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          var cubit = EnterYourInformationCubit.get(context);
                          return Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              cubit.image == null
                                  ? Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/user.png'),
                                          )),
                                    )
                                  : Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: MemoryImage(cubit.image!),
                                          )),
                                    ),
                              CircleAvatar(
                                backgroundColor: ColorsManager.lightBlack,
                                radius: 20.r,
                                child: CustomIconButton(
                                  onPressed: () {
                                    print('m');
                                    cubit.pickImage();
                                  },
                                  icon: Icons.edit,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomTextFormField(
                        label: WordsManager.name,
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if(value!.isEmpty){
                            return WordsManager.nameValidation;
                          }
                          return null;
                        },
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        label: WordsManager.email,
                        prefixIcon: Icons.email_outlined,
                        validator: (value) {
                          if(value!.isEmpty){
                            return WordsManager.emailValidation;
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      BlocConsumer<EnterYourInformationCubit, EnterYourInformationStates>(
                        listener: (context, state) {
                          if(state is UploadUserDataSuccessfullyState){
                            navigateAndFinish(context: context, page: const ChatsView(), route: RoutesManager.chatsView);
                          }
                        },
                        builder: (context, state) {
                          var cubit = EnterYourInformationCubit.get(context);
                          if (state is UploadUserDataLoadingState) {
                            return const Loading();
                          } else {
                            return CustomButton(
                              label: 'Confirm',
                              onPressed: () {
                                if(formKey.currentState!.validate() && cubit.image != null){
                                  cubit.uploadUserData(
                                    phone: phone!,
                                    name: nameController.text,
                                    id: uId!,
                                    email: emailController.text,
                                    image: cubit.imageUrl!,
                                  );
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
      ),
    );
  }
}
