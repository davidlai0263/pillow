import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Positioned(
                  top: 100,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: size.height * 0.3.h, maxWidth: 750.w),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/how.png',
                              width: 120.w,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed('/home');
                                },
                                child: Image.asset(
                                  'assets/images/back.png',
                                  width: 80.w,
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: size.height * 0.3.h, maxWidth: 750.w),
                        child: Image.asset(
                          'assets/images/map.png',
                          width: size.width.w,
                          fit: BoxFit.contain,
                        ))),
                Positioned(
                    child: Container(
                  constraints: BoxConstraints(
                      maxHeight: size.height * 0.4.h, maxWidth: 750.w),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.yellow.shade300.withOpacity(0.6),
                  ),
                  width: size.width * 0.8,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                        '本程式中有提供地圖可以查看地點，到指定地點後會自動跳出挑戰及提示，依照提示指示回答問題若正確的話可以獲得轉盤機會隨機獲得積分，積分可累積並於地圖頁面點選兌換，可依照不同的積分兌換優惠或獎品。',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 4)),
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
