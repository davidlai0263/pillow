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
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: size.height * 0.4, maxWidth: 750),
                child: Image.asset(
                  'assets/images/under.png',
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: size.height * 0.05,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: size.height * 0.55, maxWidth: 750),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/head.png',
                        height: size.height * 0.3,
                        width: size.width,
                      ),
                      Positioned(
                          right: size.width * 0.05,
                          top: size.height * 0.08,
                          child: Image.asset(
                            'assets/images/pillow.png',
                            width: size.width * 0.225,
                            height: size.height * 0.225,
                          )),
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.asset(
                            'assets/images/pillow.png',
                            width: size.width * 0.265,
                            height: size.height * 0.265,
                          ))
                    ],
                  ),
                )),
            Positioned(
              top: size.height * 0.5,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DoodleBtnWidget(
                      onTapCallback: () {
                        Get.toNamed(RouteConfig.rules);
                      },
                      text: '玩法說明',
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(RouteConfig.rules);
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            primary: Colors.black,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            side: const BorderSide(
                              color: Color(0xff404040),
                              width: 4.0,
                            )),
                        child: const Text(
                          '公車時刻',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(RouteConfig.rules);
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            primary: Colors.black,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            side: const BorderSide(
                              color: Color(0xff404040),
                              width: 4.0,
                            )),
                        child: const Text(
                          '開始遊戲',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
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
