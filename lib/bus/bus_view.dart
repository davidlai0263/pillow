import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import '../component/doodle_btn/btn_view.dart';
import 'bus_logic.dart';

class BusPage extends StatelessWidget {
  final logic = Get.put(BusLogic());
  final state = Get.find<BusLogic>().state;

  BusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BusLogic logic = Get.put(BusLogic());
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
              Get.back();
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
            facWidth: 0.365,
            facHeight: 0.085,
            text: '公車時刻',
            activation: false,
          ),
        ),
        Positioned(
            top: 135.h,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 0.95.sw,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DoodleBtnWidget(
                    tag: 'bus_755',
                    onTapUpCallback: () {
                      logic.setBusID(0);
                    },
                    facWidth: 0.3,
                    facHeight: 0.08,
                    text: '755',
                    textSize: 16,
                  ),
                  DoodleBtnWidget(
                    tag: 'bus_15',
                    onTapUpCallback: () {
                      logic.setBusID(1);
                    },
                    facWidth: 0.3,
                    facHeight: 0.08,
                    text: '綠15',
                    textSize: 16,
                  ),
                  DoodleBtnWidget(
                    tag: 'bus_info',
                    facWidth: 0.3,
                    facHeight: 0.08,
                    onTapUpCallback: () {
                      Get.defaultDialog(
                          title: '路線說明',
                          titlePadding: EdgeInsets.symmetric(vertical: 8.h),
                          titleStyle: TextStyle(
                              fontSize: 20.sp,
                              height: 1.5,
                              fontWeight: FontWeight.bold),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0.w),
                          backgroundColor:
                              Colors.yellow.shade300.withOpacity(0.85),
                          content: Center(
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 4),
                                    children: const [
                                  TextSpan(text: '※錦普觀光梨園為單邊設站(僅有去程)\n'),
                                  TextSpan(text: '※755路公車未達地點之交通方式\n'),
                                  TextSpan(
                                      text: '橘子咖啡：',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '於枕頭山下車後步行6分鐘或於錦普觀光梨園下車後步行8分鐘。\n'),
                                  TextSpan(
                                      text: '波的農場: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: '於頭份村下車後步行6分鐘\n'),
                                  TextSpan(
                                      text: '豬龍寨: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: '於望龍埤下車後步行9分鐘',
                                  ),
                                ])),
                          ));
                    },
                    text: '路線說明',
                    textSize: 16,
                  ),
                ],
              ),
            )),
        Positioned(
            top: 215.h,
            child: GetBuilder<BusLogic>(
              builder: (logic) {
                return Row(
                  children: [
                    AnimatedToggleSwitch<bool>.dual(
                      current: logic.busRoute,
                      borderRadius: BorderRadius.circular(16.r),
                      indicatorBorderRadius: BorderRadius.circular(12.r),
                      indicatorSize: Size(46.w, double.infinity),
                      first: true,
                      second: false,
                      dif: 25.0.w,
                      borderColor: const Color(0xff404040),
                      borderWidth: 3.5.r,
                      height: 55.h,
                      animationOffset: const Offset(20.0, 0),
                      onChanged: (b) => logic.setBusRoute(),
                      colorBuilder: (b) =>
                          b ? Colors.green.shade300 : Colors.grey,
                      iconBuilder: (value) => value
                          ? Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 32.r,
                            )
                          : Icon(Icons.arrow_back_ios_outlined, size: 32.r),
                      textBuilder: (value) => value
                          ? Center(
                              child: Text(
                              '去程',
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                          : Center(
                              child: Text(
                              '回程',
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                    ),
                    SizedBox(
                      width: 0.1.sw,
                    ),
                    AnimatedToggleSwitch<bool>.dual(
                      current: logic.busTime,
                      borderRadius: BorderRadius.circular(16.r),
                      indicatorBorderRadius: BorderRadius.circular(12.r),
                      indicatorSize: Size(46.w, double.infinity),
                      first: true,
                      second: false,
                      dif: 25.0.w,
                      borderColor: const Color(0xff404040),
                      borderWidth: 3.5.r,
                      height: 55.h,
                      animationOffset: const Offset(20.0, 0),
                      onChanged: (b) => logic.setBusTime(),
                      colorBuilder: (b) =>
                          b ? Colors.blue.shade100 : Colors.blueAccent.shade700,
                      iconBuilder: (value) => value
                          ? Icon(Icons.wb_sunny_outlined, size: 32.r)
                          : Icon(Icons.nightlight_outlined, size: 32.r),
                      textBuilder: (value) => value
                          ? Center(
                              child: Text(
                              '上午',
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                          : Center(
                              child: Text(
                              '下午',
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                    ),
                  ],
                );
              },
            )),
        Positioned(
            top: 285.h,
            child: GetBuilder<BusLogic>(
              builder: (logic) {
                return Column(
                  children: [
                    Container(
                      width: 0.7.sw,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Center(
                            child: Text(
                          '${logic.sheetTitle}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.sp,
                          ),
                        )),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5.r),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 0.57.sh,
                        ),
                        child: SingleChildScrollView(
                          child: Image.asset(
                            'assets/images/bus${logic.busSheet}.png',
                            width: 0.9.sw,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ))
      ],
    ));
  }
}
