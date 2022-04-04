import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'btn_logic.dart';

class DoodleBtnWidget extends StatelessWidget {
  final String? tag;
  final Function onTapCallback;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double facWidth;
  final double facHeight;
  final String text;
  final double textSize;
  final IconData icon;
  final double iconSize;
  final bool isText;
  final bool activation;

  const DoodleBtnWidget(
      {Key? key,
      this.tag,
      required this.onTapCallback,
      this.backgroundColor = const Color(0xFFFFFFFF),
      this.borderColor = const Color(0xff404040),
      this.borderWidth = 3.25,
      this.borderRadius = 16.0,
      this.facWidth = 0.365,
      this.facHeight = 0.088,
      this.text = '',
      this.textSize = 25.0,
      this.icon = Icons.arrow_back_rounded,
      this.iconSize = 42.0,
      this.isText = true,
      this.activation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DoodleBtnWidgetLogic(), tag: tag);
    return GestureDetector(
      onTapDown: activation
          ? (tapDown) {
              logic.tap();
            }
          : null,
      onTapUp: activation
          ? (tapUp) {
              logic.tap();
              onTapCallback();
            }
          : null,
      onTapCancel: activation
          ? () {
              logic.tap();
            }
          : null,
      child: SizedBox(
        width: facWidth.sw,
        height: facHeight.sh,
        child: Stack(alignment: Alignment.topLeft, children: <Widget>[
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: (facWidth.sw - 5.h),
              height: (facHeight.sh - 6.h),
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
                return AnimatedAlign(
                  alignment: logic.onTapDown
                      ? Alignment.bottomRight
                      : Alignment.topLeft,
                  duration: const Duration(milliseconds: 95),
                  child: Container(
                    width: (facWidth.sw - 5.h),
                    height: (facHeight.sh - 6.h),
                    child: Center(
                      child: isText
                          ? Text(
                              text,
                              style: TextStyle(
                                color: const Color(0xFF000000),
                                fontSize: textSize.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          : Icon(
                              icon,
                              size: iconSize.r,
                            ),
                    ),
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
                  ),
                );
              })
        ]),
      ),
    );
  }
}
