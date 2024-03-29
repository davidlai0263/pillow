import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:pillow/lobby/lobby_logic.dart';
import 'package:pillow/route_config.dart';
import 'package:pillow/store/store_logic.dart';
import 'question_logic.dart';

class QuestionPage extends StatelessWidget {
  final logic = Get.put(QuestionLogic());
  final logicLobby = Get.put(LobbyLogic());
  final lobbyState = Get.find<LobbyLogic>().state;
  final logicStore = Get.put(StoreLogic());

  QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int times = 0;
    bool quit = false;

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
            top: 67.5.h,
            child: DoodleBtnWidget(
              text: lobbyState.nearLocation.name,
              facWidth: 0.55,
              facHeight: 0.1,
              onTapUpCallback: () {},
              activation: false,
            ),
          ),
          Positioned(
              top: 225.h,
              child: Container(
                color: Colors.yellow.shade300.withOpacity(0.85),
                width: 1.sw,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    lobbyState.nearLocation.qus,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.25.sp),
                  ),
                ),
              )),
          Positioned(
            top: 450.h,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 0.90.sw),
              child: Wrap(
                  spacing: 25.w,
                  runSpacing: 25.h,
                  children: lobbyState.nearLocation.choose.map((e) {
                    return DoodleBtnWidget(
                        tag: e,
                        onTapUpCallback: () async {
                          if (e == lobbyState.nearLocation.ans) {
                            Get.offNamed(RouteConfig.roulette);
                          } else {
                            times = times + 1;
                            if (times == 2) {
                              Get.back();
                              quit = true;
                            }
                            Get.defaultDialog(
                              title: quit ? '答錯過多次' : '答錯了',
                              radius: 24.r,
                              titlePadding:
                                  EdgeInsets.fromLTRB(.0, 14, .0, 8.h),
                              titleStyle: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              backgroundColor:
                                  Colors.yellow.shade300.withOpacity(0.85),
                              content: Column(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        letterSpacing: 1.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    text: quit ? '請重新再試一次' : '再試一次',
                                  )),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  DoodleBtnWidget(
                                    tag: 'DiaCancelBack',
                                    onTapUpCallback: () {
                                      Get.back();
                                    },
                                    text: '關閉',
                                    textSize: 14,
                                    facWidth: 0.2,
                                    facHeight: 0.055,
                                    borderWidth: 2.5,
                                    borderRadius: 14,
                                    devWidth: 1.75,
                                    devHeight: 1.75,
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        facWidth: 0.376,
                        facHeight: 0.1,
                        text: e);
                  }).toList()),
            ),
          )
        ],
      ),
    );
  }
}
