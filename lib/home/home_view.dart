import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:pillow/route_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(390, 844),
      context: context,
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 0.35.sh),
              child: Image.asset(
                'assets/images/under.png',
                width: 1.sw,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 40.h,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 0.45.sh),
                child: Image.asset(
                  'assets/images/head.png',
                  width: 1.sw,
                  fit: BoxFit.contain,
                ),
              )),
          Positioned(
            bottom: 150.h,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 0.35.sh),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DoodleBtnWidget(
                    tag: '玩法說明',
                    onTapUpCallback: () {
                      Get.toNamed(RouteConfig.rules);
                    },
                    text: '玩法說明',
                    isText: true,
                  ),
                  DoodleBtnWidget(
                    tag: '公車時刻',
                    onTapUpCallback: () {
                      Get.toNamed(RouteConfig.bus);
                    },
                    text: '公車時刻',
                    isText: true,
                  ),
                  DoodleBtnWidget(
                    tag: '開始遊戲',
                    onTapUpCallback: () {
                      Get.toNamed(RouteConfig.lobby);
                    },
                    text: '開始遊戲',
                    isText: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
