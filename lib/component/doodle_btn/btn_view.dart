import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'btn_logic.dart';

class DoodleBtnWidget extends StatelessWidget {
  final String? tag;
  final int delayTime;
  final bool isStatusDown;
  final bool isPopUp;
  final bool isDownToUp;
  final Function onTapUpCallback;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double facWidth;
  final double facHeight;
  final String text;
  final double textSize;
  final Color textColor;
  final double textSpacing;
  final IconData icon;
  final double iconSize;
  final bool isText;
  final bool activation;
  final double devWidth;
  final double devHeight;

  const DoodleBtnWidget({
    Key? key,
    this.tag,
    this.delayTime = 600,
    this.isStatusDown = false,
    this.isPopUp = true,
    this.isDownToUp = true,
    required this.onTapUpCallback,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xff404040),
    this.borderWidth = 3.25,
    this.borderRadius = 16.0,
    this.facWidth = 0.365,
    this.facHeight = 0.088,
    this.text = '',
    this.textSize = 24.0,
    this.textColor = const Color(0xFF000000),
    this.textSpacing = 1,
    this.icon = Icons.arrow_back_rounded,
    this.iconSize = 37.5,
    this.isText = true,
    this.activation = true,
    this.devWidth = 0,
    this.devHeight = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DoodleBtnWidgetLogic(), tag: tag);
    return SizedBox(
      width: facWidth.sw - devWidth.h,
      height: facHeight.sh - devHeight.h,
      child: Stack(alignment: Alignment.topLeft, children: <Widget>[
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: (facWidth.sw - 4.5.h),
            height: (facHeight.sh - 5.5.h),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/slash.png')),
              color: backgroundColor,
              border: Border.all(
                width: borderWidth.r,
                color: borderColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius.r),
              ),
            ),
          ),
        ),
        GetBuilder<DoodleBtnWidgetLogic>(
            tag: tag,
            builder: (logic) {
              return AbsorbPointer(
                absorbing: isDownToUp
                    ? false
                    : (isStatusDown ? !logic.onTapDown : logic.onTapDown),
                child: GestureDetector(
                  onTapDown: activation
                      ? (tapDown) {
                          logic.tap();
                        }
                      : null,
                  onTapUp: activation
                      ? (tapUp) async {
                          logic.isDelay ? null : onTapUpCallback();
                          logic.isDelay ? null : logic.delay(delayTime);
                          isPopUp ? logic.tap() : null;
                        }
                      : null,
                  onTapCancel: activation
                      ? () {
                          logic.tap();
                        }
                      : null,
                  child: AnimatedAlign(
                    alignment:
                        (isStatusDown ? !logic.onTapDown : logic.onTapDown)
                            ? Alignment.bottomRight
                            : Alignment.topLeft,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      width: (facWidth.sw - 4.5.h),
                      height: (facHeight.sh - 5.5.h),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(
                          width: borderWidth.r,
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(borderRadius.r),
                        ),
                      ),
                      child: Center(
                        child: isText
                            ? FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: textSize.sp,
                                    fontWeight: FontWeight.bold,
                                    height: 1.22,
                                  ),
                                ),
                              )
                            : Icon(
                                icon,
                                size: iconSize.h,
                              ),
                      ),
                    ),
                  ),
                ),
              );
            })
      ]),
    );
  }
}
