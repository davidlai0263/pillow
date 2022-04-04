import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'btn_logic.dart';

class DoodleBtnWidget extends StatelessWidget {
  final Function onTapCallback;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final String text;

  DoodleBtnWidget({
    Key? key,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xff404040),
    this.borderWidth = 3.5,
    this.borderRadius = 16.0,
    required this.text,
    required this.onTapCallback,
  }) : super(key: key);

  final logic = Get.put(DoodleBtnWidgetLogic());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDown) {
        logic.tap();
      },
      onTapUp: (tapUp) {
        logic.tap();
      },
      onTapCancel: () {
        logic.tap();
      },
      child: SizedBox(
        width: 160.w,
        height: 80.w,
        child: Stack(alignment: Alignment.topLeft, children: <Widget>[
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 155.w,
              height: 74.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/slash.png')),
                color: backgroundColor,
                border: Border.all(
                  width: borderWidth,
                  color: borderColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedAlign(
              alignment: logic.onTapDown.value
                  ? Alignment.bottomRight
                  : Alignment.topLeft,
              duration: const Duration(milliseconds: 95),
              child: Container(
                width: 155.w,
                height: 74.w,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xFF000000),
                      fontSize: 26.0.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(
                    width: borderWidth,
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
