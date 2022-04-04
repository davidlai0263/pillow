import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bus_logic.dart';

class BusPage extends StatelessWidget {
  final logic = Get.put(BusLogic());
  final state = Get.find<BusLogic>().state;

  BusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: size.width.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/bus.png',
                        width: 120.w,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {
                            Get.offAllNamed('/home');
                          },
                          child: Image.asset(
                            'assets/images/back.png',
                            width: 80.w,
                            fit: BoxFit.fill,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755去程-上午\n(往大礁溪橋)'))),
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755去程-下午\n(往大礁溪橋)'))),
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755返程-上午\n(往大礁溪橋)'))),
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755返程-下午\n(往大礁溪橋)'))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755去程-上午\n(往大礁溪橋)'))),
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755去程-上午\n(往大礁溪橋)'))),
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755去程-上午\n(往大礁溪橋)'))),
                      SizedBox(
                          width: size.width * 0.225,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('755去程-上午\n(往大礁溪橋)'))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: size.height * 0.4.h, maxWidth: 750.w),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.yellow.shade300.withOpacity(0.6),
                    ),
                    width: size.width * 0.8,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                          '※錦普觀光梨園為單邊設站(僅有去程)\n※755路公車未達地點之交通方式\n橘子咖啡：於枕頭山下車後步行6分鐘\n　　　　　或於錦普觀光梨園下車後步行8分鐘。\n波的農場: 於頭份村下車後步行6分鐘\n豬龍寨: 於望龍埤下車後步行9分鐘',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
