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
                text: '使用說明',
                activation: false,
              ),
            ),
            Positioned(
                bottom: 0.45.sh,
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 0.35.sh,
                    ),
                    child: Image.asset(
                      'assets/images/map.png',
                      width: 0.9.sw,
                      fit: BoxFit.contain,
                    ))),
            Positioned(
                bottom: 0.1.sw,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 0.35.sh,
                  ),
                  width: 0.8.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    color: Colors.yellow.shade300.withOpacity(0.6),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(12.0.r),
                      child: Text(
                          '本程式中有提供地圖可以查看地點，到指定地點後會自動跳出挑戰及提示，依照提示指示回答問題若正確的話可以獲得轉盤機會隨機獲得積分，積分可累積並於地圖頁面點選兌換，可依照不同的積分兌換優惠或獎品。',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4)),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
