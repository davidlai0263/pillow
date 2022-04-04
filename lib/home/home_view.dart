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
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(390, 844),
      context: context,
    );
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: size.height * 0.4.h, maxWidth: 750.w),
                child: Image.asset(
                  'assets/images/under.png',
                  width: size.width.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: size.height * 0.5.h, maxWidth: 750.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/head.png',
                        height: size.height * 0.3.h,
                        width: size.width * 0.9.w,
                      ),
                      Positioned(
                          right: 0,
                          top: 60.h,
                          child: Image.asset(
                            'assets/images/pillow.png',
                            width: 110.w,
                            height: 110.h,
                          )),
                      Positioned(
                          left: 0,
                          bottom: 40.h,
                          child: Image.asset(
                            'assets/images/pillow.png',
                            width: 100.w,
                            height: 100.h,
                          ))
                    ],
                  ),
                )),
            Positioned(
              top: 380.h,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.4.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DoodleBtnWidget(
                      onTapCallback: () {
                        Get.toNamed(RouteConfig.rules);
                      },
                      text: '玩法說明',
                    ),
                    DoodleBtnWidget(
                      onTapCallback: () {
                        Get.toNamed(RouteConfig.rules);
                      },
                      text: '公車課表',
                    ),
                    DoodleBtnWidget(
                      onTapCallback: () {
                        Get.toNamed(RouteConfig.rules);
                      },
                      text: '開始遊戲',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
