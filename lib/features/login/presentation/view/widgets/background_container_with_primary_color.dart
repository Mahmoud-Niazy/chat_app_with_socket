import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';

class BackgroundContainerWithPrimaryColor extends StatelessWidget {
  final String text;

  const BackgroundContainerWithPrimaryColor({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * .55,
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        color: ColorsManager.primaryColor,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
            ),
            child: Text(
              text,
              style: TextStylesManager.labelLarge30,
            ),
          ),
        ),
      ),
    );
  }
}
