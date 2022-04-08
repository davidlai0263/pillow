import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.spaceEvenly,
      children: coupon
          .map((c) => Column(
                children: [
                  Image(
                    width: 0.3.sw,
                    image: c.image,
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
                              EdgeInsets.symmetric(horizontal: 12.0.w),
                          backgroundColor:
                              Colors.yellow.shade300.withOpacity(0.85),
                          content: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    letterSpacing: 1.sp,
                                      color: Colors.black
                                  ),
                                  text: '是否花費',
                                  children: [
                                TextSpan(
                                    text: '「${c.point}積分」',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold,)),
                              ])));
                    },
                    text: '${c.point}積分',
                    textSize: 16,
                    borderWidth: 2,
                    facWidth: 0.21,
                    facHeight: 0.055,
                    borderRadius: 12,
                    devWidth: 1.6,
                    devHeight: 1.5,
                  )
                ],
              ))
          .toList(),
    );
  }
}
