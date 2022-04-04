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
    this.borderRadius = 18.0,
    required this.text,
    required this.onTapCallback,
  }) : super(key: key);

  final logic = Get.put(DoodleBtnWidgetLogic());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTapDown: (tapDown) {
      //   onTapDown.value = true;
      //
      // },
      // onTapUp: (tapUp) {
      //   onTapDown.value = false;
      //   onTapCallback;
      // },
      // onTapCancel: () {
      //   onTapDown.value = false;
      // },
      child: SizedBox(
        width: ScreenUtil().setWidth(160),
        height: ScreenUtil().setHeight(80),
        child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: ScreenUtil().setWidth(156),
              height: ScreenUtil().setHeight(74),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/images/slash.png')),
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
          Container(
            width: ScreenUtil().setWidth(156),
            height: ScreenUtil().setHeight(74),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                ),
                // textScaleFactor: 1.0,
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
        ]),
      ),
    );
  }
}
