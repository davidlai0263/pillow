import 'package:flutter/cupertino.dart';
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
    double screenSizeWidth = Get.width;
    double screenSizeHeight = Get.height;
    return SafeArea(
      child: Scaffold(body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/head.png', width: screenSizeWidth),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenSizeHeight*0.09, horizontal: screenSizeWidth*0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/pillow.png', width: screenSizeWidth*0.3, height: screenSizeWidth*0.3,)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Image.asset('assets/pillow.png', width: screenSizeWidth*0.3, height: screenSizeWidth*0.3,)
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Get.toNamed(RouteConfig.rules);
                }, child: Text('玩法說明')),
                ElevatedButton(onPressed: (){
                  Get.toNamed(RouteConfig.bus);
                }, child: Text('公車時刻')),
                ElevatedButton(onPressed: (){
                  Get.toNamed(RouteConfig.lobby);
                }, child: Text('開始遊戲'))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
