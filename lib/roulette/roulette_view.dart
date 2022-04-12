import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:pillow/store/store_logic.dart';
import 'roulette_logic.dart';

class RoulettePage extends StatelessWidget {
  final logic = Get.put(RouletteLogic());
  final state = Get.find<RouletteLogic>().state;

  RoulettePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: 1.sw,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 57.5.h,
            child: DoodleBtnWidget(
              tag: '返回',
              onTapUpCallback: () {
                logic.isSpinning
                    ? Get.back()
                    : Get.defaultDialog(
                        title: '確定退出？',
                        titlePadding: EdgeInsets.symmetric(vertical: 8.h),
                        titleStyle: TextStyle(
                            fontSize: 20.sp,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
                        contentPadding:
                            EdgeInsets.fromLTRB(12.0.w, 0, 12.0.w, 12.h),
                        backgroundColor:
                            Colors.yellow.shade300.withOpacity(0.85),
                        content: RichText(
                            text: TextSpan(
                          style: TextStyle(
                              fontSize: 16.sp,
                              letterSpacing: 0.9.sp,
                              color: Colors.black),
                          text: '您目前尚未抽獎，如退出將失去獲得積分的機會！',
                        )),
                        cancel: DoodleBtnWidget(
                          tag: 'cancelBack',
                          onTapUpCallback: () {
                            Get.back();
                          },
                          text: '取消',
                          textSize: 14,
                          facWidth: 0.2,
                          facHeight: 0.055,
                          borderWidth: 2,
                          borderRadius: 14,
                          devWidth: 1.5,
                          devHeight: 1.5,
                        ),
                        confirm: DoodleBtnWidget(
                          tag: 'sureBack',
                          onTapUpCallback: () {
                            Get.back();
                            Get.back();
                          },
                          text: '確定',
                          textSize: 14,
                          facWidth: 0.2,
                          facHeight: 0.055,
                          borderWidth: 2,
                          borderRadius: 14,
                          devWidth: 1.5,
                          devHeight: 1.5,
                        ),
                      );
                // Get.put(LobbyLogic());
              },
              facWidth: 0.245,
              facHeight: 0.07,
              text: '關閉',
            ),
          ),
          Positioned(
            top: 50.h,
            child: DoodleBtnWidget(
              onTapUpCallback: () {},
              facWidth: 0.376,
              facHeight: 0.085,
              text: '抽獎轉盤',
              activation: false,
            ),
          ),
          Center(
              child: AbsorbPointer(
            absorbing: true,
            child: SpinnerWheel(logic: logic),
          )),
          Positioned(
            child: Container(
              height: 65.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  logic.isSpinning
                      ? null
                      : logic.wheelNotifier.sink
                          .add((Random().nextInt(10000) + 5000));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SpinnerWheel extends StatelessWidget {
  SpinnerWheel({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final storeState = Get.find<StoreLogic>().state;
  final RouletteLogic logic;

  @override
  Widget build(BuildContext context) {
    return SpinningWheel(
      Image.asset('assets/images/turnablered.png'),
      width: .9.sw,
      height: .9.sw,
      initialSpinAngle: logic.generateRandomAngle(),
      spinResistance: 0.6,
      canInteractWhileSpinning: false,
      dividers: 6,
      onUpdate: (int point) {
        //轉動時觸發轉到什麼
      },
      onEnd: (int index) async {
        logic.isSpinning = true;
        List<int> list = [1, 3, 5, 3, 3, 5];
        debugPrint('point ${list[index - 1]}');
        storeState.credit.value += list[index - 1];
        storeState.saveCredit();
        Get.defaultDialog(
          title: '中獎！',
          titlePadding: EdgeInsets.symmetric(vertical: 6.h),
          titleStyle: TextStyle(
              fontSize: 20.sp, height: 1.5, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.fromLTRB(10.0.w, 0, 10.0.w, 10.h),
          backgroundColor: Colors.yellow.shade300.withOpacity(0.85),
          content: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 16.sp,
                      letterSpacing: 1.sp,
                      color: Colors.black),
                  text: '恭喜獲得',
                  children: [
                TextSpan(
                  text: '${list[index - 1]}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.sp, fontSize: 18.sp),
                ),
                const TextSpan(
                  text: '點積分',
                )
              ])),
          confirm: DoodleBtnWidget(
            tag: 'sureBack',
            onTapUpCallback: () {
              Get.back();
              Get.back();
            },
            text: '確定',
            textSize: 14,
            facWidth: 0.2,
            facHeight: 0.055,
            borderWidth: 2,
            borderRadius: 14,
            devWidth: 1.5,
            devHeight: 1.5,
          ),
        );
      },
      shouldStartOrStop: logic.wheelNotifier.stream,
      secondaryImage: Image.asset('assets/images/gored.png'),
      secondaryImageHeight: 125.h,
      secondaryImageWidth: 125.w,
    );
  }
}
