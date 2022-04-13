import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pillow/component/data/coupon.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:pillow/lobby/lobby_logic.dart';
import 'package:pillow/route_config.dart';
import 'package:pillow/store/store_state.dart';
import 'store_logic.dart';

class StorePage extends StatelessWidget {
  final logic = Get.put(StoreLogic());
  final state = Get.find<StoreLogic>().state;

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
                child: const Text('roulette'),
              )),
          Positioned(
            top: 57.5.h,
            left: 10.w,
            child: DoodleBtnWidget(
              tag: 'storeBack',
              onTapUpCallback: () async {
                if (Get.isSnackbarOpen) {
                  Get.closeAllSnackbars();
                  await Future.delayed(const Duration(milliseconds: 550));
                }
                Get.put(LobbyLogic()).positionStream.resume();
                Get.back();
                // Get.put(LobbyLogic()).controller.repeat(reverse: true);
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
                  child: CouponWidget(logic: logic, state: state))),
          Positioned(
            top: 0.225.sh,
            child: SizedBox(
              height: 27.5.sp,
              child: GetBuilder<LobbyLogic>(builder: (logic) {
                return AlignTransition(
                  alignment: logic.animation,
                  child: Text(
                    '點擊折價卷以使用',
                    style: TextStyle(
                      height: 1.265,
                      letterSpacing: 1.5.sp,
                      color: Colors.white,
                      fontSize: 20.sp,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(4.5.w, 4.5.h),
                          blurRadius: 7.5.r,
                          color: const Color.fromARGB(255, 47, 47, 47),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 100.h,
            child: Obx(() => Text(
                  '現有積分：${state.credit}',
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

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    Key? key,
    required this.logic,
    required this.state,
  }) : super(key: key);

  final StoreLogic logic;
  final StoreState state;

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
                  GestureDetector(
                    onTap: () {
                      debugPrint('onPressCoupon${c.gift}');
                    },
                    child: SvgPicture.asset(
                      c.image,
                      width: 0.3.sw,
                      color: Colors.black,
                    ),
                  ),
                  GetBuilder<StoreLogic>(
                    assignId: true,
                    builder: (logic) {
                      return Text(
                        '擁有：${state.coupon[c.index]}',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  SizedBox(height: 4.h),
                  DoodleBtnWidget(
                    tag: '${c.point}Point',
                    onTapUpCallback: () {
                      Get.defaultDialog(
                        title: '${c.gift}元折價券',
                        titlePadding:
                            EdgeInsets.fromLTRB(.0.w, 10.0.w, .0.w, 6.0.w),
                        titleStyle: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                        contentPadding:
                            EdgeInsets.fromLTRB(14.0.w, 1.0.w, 14.0.w, .0),
                        backgroundColor:
                            Colors.yellow.shade300.withOpacity(0.85),
                        content: Column(
                          children: [
                            RichText(
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
                            SizedBox(
                              height: 11.5.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DoodleBtnWidget(
                                  tag: 'shopCancel',
                                  onTapUpCallback: () async {
                                    if (Get.isSnackbarOpen) {
                                      Get.closeAllSnackbars();
                                      await Future.delayed(
                                          const Duration(milliseconds: 550));
                                    }
                                    Get.back();
                                  },
                                  text: '取消',
                                  textSize: 14,
                                  facWidth: 0.2,
                                  facHeight: 0.055,
                                  borderWidth: 2,
                                  borderRadius: 14,
                                  devWidth: 1.75,
                                  devHeight: 1.75,
                                ),
                                DoodleBtnWidget(
                                  tag: 'shopSure',
                                  onTapUpCallback: () async {
                                    Get.back();
                                    bool enough = state.credit.value >= c.point;
                                    if (state.credit.value > c.point) {
                                      int point = c.point;
                                      state.credit.value -= point;
                                      state.coupon[c.index] += 1;
                                      state.saveCredit();
                                      state.saveCoupon();
                                      logic.haveChange();
                                    }
                                    Get.snackbar(
                                      '',
                                      '',
                                      animationDuration:
                                          const Duration(milliseconds: 500),
                                      titleText: Text(
                                        enough ? '積分足夠：' : '積分不足：',
                                        style: TextStyle(
                                          fontSize: 14.sp,
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 18.h),
                                      borderRadius: 36.r,
                                      duration: const Duration(seconds: 2),
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
                                  devWidth: 1.75,
                                  devHeight: 1.75,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    text: '${c.point}積分',
                    textSize: 16,
                    borderWidth: 2,
                    facWidth: 0.21,
                    facHeight: 0.055,
                    borderRadius: 12,
                    devWidth: 1.75,
                    devHeight: 1.75,
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
