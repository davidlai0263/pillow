import 'package:flutter/cupertino.dart';
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
  final state = Get.find<QuestionLogic>().state;
  final logicLobby = Get.put(LobbyLogic());
  final lobbyState = Get.find<LobbyLogic>().state;
  final logicStore = Get.put(StoreLogic());

  QuestionPage({Key? key}) : super(key: key);

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
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Positioned(
              top: 450.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      DoodleBtnWidget(
                        tag: 'Ans0',
                        onTapUpCallback: () {
                          if (lobbyState.nearLocation.choose[0] ==
                              lobbyState.nearLocation.ans) {
                            Get.offNamed(RouteConfig.roulette);
                          } else {
                            Get.snackbar(
                              '',
                              '',
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              titleText: Text(
                                '答錯了',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              messageText: Text(
                                '再試一次',
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
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.black38,
                              snackPosition: SnackPosition.BOTTOM,
                              maxWidth: 0.5.sw,
                            );
                          }
                        },
                        facWidth: 0.376,
                        facHeight: 0.1,
                        text: lobbyState.nearLocation.choose[0],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      DoodleBtnWidget(
                        tag: 'Ans1',
                        onTapUpCallback: () {
                          if (lobbyState.nearLocation.choose[1] ==
                              lobbyState.nearLocation.ans) {
                            Get.offNamed('/roulette');
                          } else {
                            Get.snackbar(
                              '',
                              '',
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              titleText: Text(
                                '答錯了',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              messageText: Text(
                                '再試一次',
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
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.black38,
                              snackPosition: SnackPosition.BOTTOM,
                              maxWidth: 0.5.sw,
                            );
                          }
                        },
                        facWidth: 0.376,
                        facHeight: 0.1,
                        text: lobbyState.nearLocation.choose[1],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.w,
                  ),
                  Row(
                    children: [
                      DoodleBtnWidget(
                        tag: 'Ans2',
                        onTapUpCallback: () {
                          if (lobbyState.nearLocation.choose[2] ==
                              lobbyState.nearLocation.ans) {
                            Get.offNamed('/roulette');
                          } else {
                            Get.snackbar(
                              '',
                              '',
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              titleText: Text(
                                '答錯了',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              messageText: Text(
                                '再試一次',
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
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.black38,
                              snackPosition: SnackPosition.BOTTOM,
                              maxWidth: 0.5.sw,
                            );
                          }
                        },
                        facWidth: 0.376,
                        facHeight: 0.1,
                        text: lobbyState.nearLocation.choose[2],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      DoodleBtnWidget(
                        tag: 'Ans3',
                        onTapUpCallback: () {
                          if (lobbyState.nearLocation.choose[3] ==
                              lobbyState.nearLocation.ans) {
                            Get.offNamed('/roulette');
                          } else {
                            Get.snackbar(
                              '',
                              '',
                              animationDuration:
                                  const Duration(milliseconds: 500),
                              titleText: Text(
                                '答錯了',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              messageText: Text(
                                '再試一次',
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
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.black38,
                              snackPosition: SnackPosition.BOTTOM,
                              maxWidth: 0.5.sw,
                            );
                          }
                        },
                        facWidth: 0.376,
                        facHeight: 0.1,
                        text: lobbyState.nearLocation.choose[3],
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
