import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';

import 'rules_logic.dart';

class RulesPage extends StatelessWidget {
  final logic = Get.put(RulesLogic());
  final state = Get.find<RulesLogic>().state;

  RulesPage({Key? key}) : super(key: key);

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
              text: '使用說明',
              activation: false,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 120.h,
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 0.4.sh,
                  ),
                  child: Image.asset(
                    'assets/images/map.png',
                    width: 0.95.sw,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.05.sw, .0, 0.05.sw, 50.h),
                constraints: BoxConstraints(
                  maxHeight: 0.345.sh,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  color: const Color(0xb3af8337),
                ),
                child: ScrollConfiguration(
                  behavior: CustomScroll(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                      child: Text(state.ruleText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xffeaeaea),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 3.357.sp,
                              height: 1.5)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
