import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:pillow/lobby/lobby_logic.dart';
import 'roulette_state.dart';
import 'dart:async';

class RouletteLogic extends GetxController {
  final RouletteState state = RouletteState();
  final StreamController dividerController = StreamController<int>();
  final wheelNotifier = StreamController<double>();
  bool isSpinning = false;
  double generateRandomAngle() => Random().nextDouble() * pi * 2;

  Future<bool> onWillPop() async {
    Get.closeAllSnackbars();
    final shouldPop = await Get.defaultDialog(
      title: '  確定退出 ？',
      radius: 24.r,
      titlePadding: EdgeInsets.fromLTRB(.0, 14, .0, 8.h),
      titleStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
      backgroundColor: Colors.yellow.shade300.withOpacity(0.85),
      content: SizedBox(
        width: 0.62.sw,
        child: Column(
          children: [
            RichText(
                text: TextSpan(
              style: TextStyle(
                  fontSize: 16.sp, letterSpacing: 0.9.sp, color: Colors.black),
              text: '您目前尚未抽獎，如退出將失去獲得積分的機會！',
            )),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DoodleBtnWidget(
                  tag: 'DiaCancelBack',
                  onTapUpCallback: () {
                    Get.back();
                  },
                  text: '取消',
                  textSize: 14,
                  facWidth: 0.2,
                  facHeight: 0.055,
                  borderWidth: 2.5,
                  borderRadius: 14,
                  devWidth: 1.75,
                  devHeight: 1.75,
                ),
                DoodleBtnWidget(
                  tag: 'DiaSureBack',
                  onTapUpCallback: () {
                    Get.back();
                    Get.back();
                  },
                  text: '確定',
                  textSize: 14,
                  facWidth: 0.2,
                  facHeight: 0.055,
                  borderWidth: 2.5,
                  borderRadius: 14,
                  devWidth: 1.75,
                  devHeight: 1.75,
                ),
              ],
            )
          ],
        ),
      ),
    );
    return shouldPop ?? false;
  }

  @override
  void onInit() {
    Get.put(LobbyLogic()).controller.stop();
    Get.put(LobbyLogic()).positionStream.pause();
    super.onInit();
  }

  @override
  void onReady() {
    Get.snackbar(
      '',
      '',
      animationDuration: const Duration(milliseconds: 500),
      titleText: Text(
        '答對了',
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      messageText: Text(
        '獲得抽獎機會',
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 18.h),
      borderRadius: 36.r,
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.black38,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 0.5.sw,
    );
    super.onReady();
  }

  @override
  void onClose() {
    Get.put(LobbyLogic()).controller.repeat(reverse: true);
    Get.put(LobbyLogic()).positionStream.resume();
    Get.closeAllSnackbars();
    super.onClose();
  }

  // @override
  // void onReady() {
  //   ModalRoute.of(Get.context!)!.addScopedWillPopCallback(preventExit);
  //   super.onReady();
  // }
  //
  //
  // Future<bool> preventExit() async => false;
}
