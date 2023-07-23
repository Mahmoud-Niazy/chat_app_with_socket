import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';


class WhiteContainerWithWidget extends StatelessWidget {


  final Widget child ;

  const WhiteContainerWithWidget({

    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .3,
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(70.w),
        ),
        child: child,
      ),
    );
  }
}
