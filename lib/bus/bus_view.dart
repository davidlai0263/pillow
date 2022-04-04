import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/doodle_btn/btn_view.dart';
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
              bottom: 0.5.sh,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 0.35.sh,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DoodleBtnWidget(
                          tag: '755_go_am',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '755去程-上午(往大礁溪橋)',
                          textSize: 16,
                        ),
                        DoodleBtnWidget(
                          tag: '755_go_pm',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '755去程-下午(往大礁溪橋)',
                          textSize: 16,
                        ),
                        DoodleBtnWidget(
                          tag: '755_back_am',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '755回程-上午(往宜蘭轉運站2)',
                          textSize: 16,
                        ),
                        DoodleBtnWidget(
                          tag: '755_back_pm',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '755回程-下午(往宜蘭轉運站2)',
                          textSize: 16,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        DoodleBtnWidget(
                          tag: 'green15_go_am',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '綠15去程-上午(往大礁溪橋)',
                          textSize: 16,
                        ),
                        DoodleBtnWidget(
                          tag: 'green15_go_pm',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '綠15去程-上午(往大礁溪橋)',
                          textSize: 16,
                        ),
                        DoodleBtnWidget(
                          tag: 'green15_back_am',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '綠15去程-上午(往宜蘭轉運站2)',
                          textSize: 16,
                        ),
                        DoodleBtnWidget(
                          tag: 'green15_back_pm',
                          onTapCallback: () {},
                          facWidth: 0.24,
                          facHeight: 0.125,
                          text: '綠15去程-上午(往宜蘭轉運站2)',
                          textSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          // Padding(
          //   padding: EdgeInsets.only(top: 10.h),
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(top: 10.h),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             SizedBox(
          //                 width: size.width * 0.225,
          //                 child: ElevatedButton(
          //                     onPressed: () {},
          //                     child: Text('755去程-上午\n(往大礁溪橋)'))),
          //             SizedBox(
          //                 width: size.width * 0.225,
          //                 child: ElevatedButton(
          //                     onPressed: () {},
          //                     child: Text('755去程-上午\n(往大礁溪橋)'))),
          //             SizedBox(
          //                 width: size.width * 0.225,
          //                 child: ElevatedButton(
          //                     onPressed: () {},
          //                     child: Text('755去程-上午\n(往大礁溪橋)'))),
          //             SizedBox(
          //                 width: size.width * 0.225,
          //                 child: ElevatedButton(
          //                     onPressed: () {},
          //                     child: Text('755去程-上午\n(往大礁溪橋)'))),
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(top: 10.h),
          //         child: Container(
          //           constraints: BoxConstraints(
          //               maxHeight: size.height * 0.4.h, maxWidth: 750.w),
          //           decoration: BoxDecoration(
          //             borderRadius:
          //                 const BorderRadius.all(Radius.circular(10.0)),
          //             color: Colors.yellow.shade300.withOpacity(0.6),
          //           ),
          //           width: size.width * 0.8,
          //           child: const Padding(
          //             padding:
          //                 EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //             child: Text(
          //                 '※錦普觀光梨園為單邊設站(僅有去程)\n※755路公車未達地點之交通方式\n橘子咖啡：於枕頭山下車後步行6分鐘\n　　　　　或於錦普觀光梨園下車後步行8分鐘。\n波的農場: 於頭份村下車後步行6分鐘\n豬龍寨: 於望龍埤下車後步行9分鐘',
          //                 textAlign: TextAlign.start,
          //                 style: TextStyle(
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w500,
          //                     letterSpacing: 4)),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Positioned(
              bottom: 0.9.sw,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 0.35.sh,
                ),
                width: 0.9.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  color: Colors.yellow.shade300.withOpacity(0.6),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(5.0.r),
                    child: Text(
                        '※錦普觀光梨園為單邊設站(僅有去程)\n※755路公車未達地點之交通方式\n橘子咖啡：於枕頭山下車後步行6分鐘或於錦普觀光梨園下車後步行8分鐘。\n波的農場: 於頭份村下車後步行6分鐘\n豬龍寨: 於望龍埤下車後步行9分鐘',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 4)),
                  ),
                ),
              )),
        ],
      )),
    );
  }
}
