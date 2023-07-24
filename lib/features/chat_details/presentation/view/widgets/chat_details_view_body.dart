import 'package:chat_app/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatDetailsViewBody extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
   ChatDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: CustomTextFormField(
                  label: 'Write your message',
                  validator: (value){
                    return null;
                  },
                  controller: messageController,
                  prefixIcon: Icons.image,
                  suffixIcon: Icons.send,

                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
