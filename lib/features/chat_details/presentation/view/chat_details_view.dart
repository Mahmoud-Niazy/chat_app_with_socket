import 'package:chat_app/core/utils/text_styles.dart';
import 'package:chat_app/features/chat_details/presentation/view/widgets/chat_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final recievedData = ModalRoute.of(context)!.settings.arguments as Map ;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                recievedData['userData'].image,
                height: 35.h,
                width: 35.w,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
                recievedData['userData'].name,
              style: TextStylesManager.labelLarge20.copyWith(
                color: ColorsManager.whiteColor,
              ),
            ),
          ],
        ),
      ),
      body: ChatDetailsViewBody(),
    );
  }
}
