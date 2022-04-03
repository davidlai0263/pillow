import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pillow/route_config.dart';
import 'logic.dart';


class DoodleBtnPage extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final String text;
  final double inWidth;
  final double inHeight;
  final double outWidth;
  final double outHeight;

  DoodleBtnPage({
    Key? key,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xff404040),
    this.borderWidth = 3.5,
    this.borderRadius = 18.0,
    required this.text,
    this.inWidth = 155.5,
    this.inHeight = 75,
    this.outWidth = 160,
    this.outHeight = 80,
  }) : super(key: key);

  final logic = Get.put(DoodleBtnLogic());
  final state = Get.find<DoodleBtnLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 我在看怎麼弄成 GetX

      // onTapDown: (tapDown) {
      //   onTapDown = true;
      //
      // },
      // onTapUp: (tapUp) {
      //
      //   onTapDown = false;
      //
      // },
      // onTapCancel: () {
      //   onTapDown = false;
      // },
      child: SizedBox(
        width: outWidth,
        height: outHeight,
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: inWidth,
              height: inHeight,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/slash.png')),
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
          Align(
            alignment: Alignment.topLeft,//onTapDown ? Alignment.bottomRight : Alignment.topLeft,
            child: Container(
              width: inWidth,
              height: inHeight,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 26.0,
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
        ]),
      ),
    );
  }
}
