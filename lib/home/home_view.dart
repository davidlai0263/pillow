import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  maxHeight: 300.h
                ),
                child: Image.asset(
                  'assets/images/under.png',
                  width: 390.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 450.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/head.png',
                        width: 390.w,
                      ),
                      Positioned(
                          right: 0,
                          top: 75.h,
                          child: Image.asset(
                            'assets/images/pillow.png',
                            width: 115.w,
                            height: 115.h,
                          )),
                      Positioned(
                          left: 0,
                          bottom: 50.h,
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
                      key: const ObjectKey('玩法說明'),
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
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteConfig.rules);
                        },
                        child: const Text('Test'))
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
