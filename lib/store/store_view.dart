import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:pillow/lobby/lobby_logic.dart';
import 'package:pillow/route_config.dart';

import 'store_logic.dart';

class StorePage extends StatelessWidget {
  final logic = Get.put(StoreLogic());
  final state = Get.find<StoreLogic>().state;
  final logicLobby = Get.put(LobbyLogic());
  final lobbyState = Get.find<LobbyLogic>().state;
  StorePage({Key? key}) : super(key: key);

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
            top: 57.5.h,
            left: 10.w,
            child: DoodleBtnWidget(
              tag: '返回',
              onTapUpCallback: () {
                logicLobby.controller.repeat(reverse: true);
                logicLobby.positionStream.resume();
                Get.back();
                // Get.put(LobbyLogic());
              },
              facWidth: 0.245,
              facHeight: 0.07,
              isText: false,
            ),
          ),
          Positioned(
            top: 50.h,
            right: 110.w,
            child: DoodleBtnWidget(
              onTapUpCallback: () {
                Get.toNamed(RouteConfig.myCoupon);
              },
              facWidth: 0.376,
              facHeight: 0.085,
              text: '我的折價卷',
              activation: false,
            ),
          ),
          Positioned(child: Container(
            width: 1.sw,
            height: .45.sh,
            color: Colors.yellow.shade300.withOpacity(0.85),
          )),
          Positioned(
              bottom: 100.h ,
              child: Obx(() => Text('現有積分：${lobbyState.credit}', style: TextStyle(color: Colors.white,fontSize: 32.sp, fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
  }
}
