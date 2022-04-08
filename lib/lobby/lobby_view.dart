import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/route_config.dart';
import '../component/data/site.dart';
import '../component/doodle_btn/btn_view.dart';
import 'lobby_logic.dart';

class LobbyPage extends StatelessWidget {
  final logic = Get.put(LobbyLogic());
  final state = Get.find<LobbyLogic>().state;

  LobbyPage({Key? key}) : super(key: key);


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
            top: 57.5.h,
            right: 10.w,
            child: DoodleBtnWidget(
              onTapUpCallback: () {
                logic.controller.stop();
                logic.positionStream.pause();
                Get.toNamed(RouteConfig.store);
              },
              facWidth: 0.33,
              facHeight: 0.07,
              text: '兌換商店',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 115.h,
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
                height: 28.5.sp,
                child: GetBuilder<LobbyLogic>(builder: (logic) {
                  return AlignTransition(
                    alignment: logic.animation,
                    child: Text(
                      '請前往以下地點進行挑戰',
                      style: TextStyle(
                        height: 1.265,
                        letterSpacing: 1.5.sp,
                        color: Colors.white70,
                        fontSize: 20.sp,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(4.5.w, 4.5.h),
                            blurRadius: 7.5.r,
                            color: const Color.fromARGB(255, 47, 47, 47),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, .0, 0, 0.075.sw),
                constraints: BoxConstraints(
                  maxHeight: 0.325.sh,
                ),
                width: 1.sw,
                color: const Color(0xb3af8337),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 6.h, 10.w, 8.h),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: const Color(0xfff0f0f0),
                            fontSize: 17.sp,
                            letterSpacing: 0.9,
                            height: 1.5,
                          ),
                          children: siteMap
                              .map((map) => TextSpan(children: [
                                    TextSpan(
                                        text: '${map.name}：',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: map.address,
                                        style: const TextStyle(
                                            color: Color(0xff50acff),
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => logic.openMapsSheet(
                                                context,
                                                map.name,
                                                map.address,
                                                map.coords,
                                              ))
                                  ]))
                              .toList(),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
