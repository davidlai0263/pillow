import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rules_logic.dart';

class RulesPage extends StatelessWidget {
  final logic = Get.put(RulesLogic());
  final state = Get.find<RulesLogic>().state;

  RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/background.png',
              width: w,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 0.0),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/how.png',
                              width: w * 0.3,
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
                                  'assets/back.png',
                                  height: h * 0.07,
                                  width: w * 0.2,
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Image.asset(
                      'assets/map.png',
                      width: w,
                      fit: BoxFit.contain,
                    )),
                Expanded(
                    flex: 6,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.yellow.shade300.withOpacity(0.6),
                        ),
                        width: w * 0.8,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.05, vertical: w * 0.025),
                          child: const Text(
                              '本程式中有提供地圖可以查看地點，到指定地點後會自動跳出挑戰及提示，依照提示指示回答問題若正確的話可以獲得轉盤機會隨機獲得積分，積分可累積並於地圖頁面點選兌換，可依照不同的積分兌換優惠或獎品。',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20, letterSpacing: 4)),
                        ),
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
