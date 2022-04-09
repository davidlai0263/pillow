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
                Get.back();
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
                  logic.wheelNotifier.sink
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
      onEnd: (int index) async{
        List<int> list = [1, 3, 5, 3, 3, 5];
        debugPrint('point ${list[index - 1]}');
        storeState.credit.value += list[index - 1];
        storeState.saveCredit();
      },
      shouldStartOrStop: logic.wheelNotifier.stream,
      secondaryImage: Image.asset('assets/images/gored.png'),
      secondaryImageHeight: 125.h,
      secondaryImageWidth: 125.w,
    );
  }
}
