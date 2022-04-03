import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillow/route_config.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: top()),
          Expanded(flex: 4, child: bottom())
        ],
      ),
    ));
  }
}

Widget top() {
  return LayoutBuilder(builder: (context, BoxConstraints constraints) {
    final w = constraints.maxWidth;
    final h = constraints.maxHeight;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, w * 0.15, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/head.png', width: w),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, w * 0.05, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/pillow.png',
                    width: w * 0.3,
                    height: w * 0.3,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, w * 0.1, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/pillow.png',
                    width: h * 0.3,
                    height: h * 0.3,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  });
}

Widget bottom() {
  return LayoutBuilder(builder: (context, BoxConstraints constraints) {
    final w = constraints.maxWidth;
    final h = constraints.maxHeight;
    return Stack(children: [
      Image.asset(
        'assets/under.png',
        width: w,
        height: h * 0.9,
        fit: BoxFit.cover,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConfig.rules);
                },
                child: Text('玩法說明')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConfig.bus);
                },
                child: Text('公車時刻')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConfig.lobby);
                },
                child: Text('開始遊戲'))
          ],
        ),
      ),
    ]);
  });
}
