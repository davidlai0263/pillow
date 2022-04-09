import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pillow/component/data/coupon.dart';
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
              right: 0,
              top: 30,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RouteConfig.roulette);
                },
                child: Text('roulette'),
              )),
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
              onTapUpCallback: () {},
              facWidth: 0.376,
              facHeight: 0.085,
              text: '我的折價卷',
              activation: false,
            ),
          ),
          Positioned(
              child: Container(
            width: 1.sw,
            height: .45.sh,
            color: Colors.yellow.shade300.withOpacity(0.85),
            child: Coupon(
              logic: logic,
            ),
          )),
          Positioned(
            bottom: 100.h,
            child: Obx(() => Text(
                  '現有積分：${lobbyState.credit}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}

class Coupon extends StatelessWidget {
  final StoreLogic logic;

  const Coupon({Key? key, required this.logic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScrollConfiguration(
        behavior: CustomScroll(),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: coupon.map((c) {
              bool padding = c.point > 20;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    c.image,
                    width: 0.3.sw,
                    color: Colors.black,
                  ),
                  Text(
                    '擁有：${c.have}',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.h),
                  DoodleBtnWidget(
                    tag: '${c.point}',
                    onTapUpCallback: () {
                      Get.defaultDialog(
                        title: '${c.money}元折價券',
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
                                text: '是否花費',
                                children: [
                              TextSpan(
                                  text: '「${c.point}積分」',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              const TextSpan(
                                text: '兌換此折價券',
                              ),
                            ])),
                        confirm: DoodleBtnWidget(
                          tag: 'sure',
                          onTapUpCallback: () {
                            Get.back();
                            bool enough = lobbyState.credit.value > c.point;
                            Get.snackbar(
                              '',
                              '',
                              titleText: Text(
                                enough ? '積分足夠：' : '積分不足：',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              messageText: Text(
                                enough ? '兌換成功：' : '兌換失敗',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              margin: EdgeInsets.symmetric(vertical: 18.h),
                              borderRadius: 36.r,
                              duration: const Duration(seconds: 2),
                              animationDuration: const Duration(seconds: 1),
                              backgroundColor: Colors.black38,
                              snackPosition: SnackPosition.BOTTOM,
                              maxWidth: 0.5.sw,
                            );
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
                        cancel: DoodleBtnWidget(
                          tag: 'cancel',
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
                      );
                    },
                    text: '${c.point}積分',
                    textSize: 16,
                    borderWidth: 2,
                    facWidth: 0.21,
                    facHeight: 0.055,
                    borderRadius: 12,
                    devWidth: 1.5,
                    devHeight: 1.5,
                  ),
                  padding
                      ? SizedBox(
                          height: 12.h,
                        )
                      : const SizedBox(
                          height: .0,
                        )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
