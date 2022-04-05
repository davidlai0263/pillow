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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: size.width.w,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 27.5.h,
            left: 10.w,
            child: DoodleBtnWidget(
              tag: '返回',
              onTapCallback: () {
                Get.back();
              },
              facWidth: 0.245,
              facHeight: 0.07,
              isText: false,
            ),
          ),
          Positioned(
            top: 20.h,
            right: 110.w,
            child: DoodleBtnWidget(
              onTapCallback: () {},
              facWidth: 0.365,
              facHeight: 0.085,
              text: '公車時刻',
              activation: false,
            ),
          ),
          Positioned(
              top: 0.125.sh,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 0.35.sh,
                ),
                child: Row(
                  children: [
                    DoodleBtnWidget(
                      tag: 'bus_755',
                      onTapCallback: () {
                        logic.setBusID(0);
                      },
                      facWidth: 0.3,
                      facHeight: 0.08,
                      text: '755',
                      textSize: 16,
                    ),
                    DoodleBtnWidget(
                      tag: 'bus_green15',
                      onTapCallback: () {
                        logic.setBusID(1);
                      },
                      facWidth: 0.3,
                      facHeight: 0.08,
                      text: '綠15',
                      textSize: 16,
                    ),
                    DoodleBtnWidget(
                      tag: 'bus_info',
                      onTapCallback: () {
                        Get.defaultDialog(
                            title: '路線說明',
                            contentPadding: EdgeInsets.all(10.0.w),
                            backgroundColor:
                                Colors.yellow.shade300.withOpacity(0.9),
                            content: SizedBox(
                              width: 1.sw,
                              height: 0.3.sh,
                              child: Center(
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
                                          text:
                                              '於枕頭山下車後步行6分鐘或於錦普觀光梨園下車後步行8分鐘。\n'),
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
                              ),
                            ));
                      },
                      facWidth: 0.3,
                      facHeight: 0.08,
                      text: '路線說明',
                      textSize: 16,
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 0.215.sh,
              child: GetBuilder<BusLogic>(
                builder: (logic) {
                  return Row(
                    children: [
                      AnimatedToggleSwitch<bool>.dual(
                        current: logic.busRoute,
                        first: true,
                        second: false,
                        dif: 25.0.w,
                        borderColor: Colors.transparent,
                        borderWidth: 5.0,
                        height: 55.h,
                        animationOffset: const Offset(20.0, 0),
                        clipAnimation: true,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1.5),
                          ),
                        ],
                        onChanged: (b) => logic.setBusRoute(),
                        colorBuilder: (b) =>
                            b ? Colors.green.shade300 : Colors.grey,
                        iconBuilder: (value) => value
                            ? Icon(Icons.arrow_forward_ios)
                            : Icon(Icons.arrow_back_ios),
                        textBuilder: (value) => value
                            ? Center(child: Text('去程'))
                            : Center(child: Text('回程')),
                      ),
                      SizedBox(
                        width: 0.1.sw,
                      ),
                      AnimatedToggleSwitch<bool>.dual(
                        current: logic.busTime,
                        first: true,
                        second: false,
                        dif: 25.0.w,
                        borderColor: Colors.transparent,
                        borderWidth: 5.0,
                        height: 55.h,
                        animationOffset: const Offset(20.0, 0),
                        clipAnimation: true,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1.5),
                          ),
                        ],
                        onChanged: (b) => logic.setBusTime(),
                        colorBuilder: (b) => b
                            ? Colors.blue.shade100
                            : Colors.blueAccent.shade700,
                        iconBuilder: (value) => value
                            ? Icon(Icons.wb_sunny_outlined)
                            : Icon(Icons.nightlight_outlined),
                        textBuilder: (value) => value
                            ? Center(child: Text('上午'))
                            : Center(child: Text('下午')),
                      ),
                    ],
                  );
                },
              )),
          Positioned(
              top: 0.3.sh,
              child: GetBuilder<BusLogic>(
                builder: (logic) {
                  return Column(
                    children: [
                      Container(
                        width: 0.7.sw,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                          child: Center(child: Text(
                            '${logic.sheetTitle}', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),)),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Image.asset(
                        'assets/images/bus${logic.busSheet}.png',
                        width: 0.9.sw,
                      ),
                    ],
                  );
                },
              ))
        ],
      )),
    );
  }
}
