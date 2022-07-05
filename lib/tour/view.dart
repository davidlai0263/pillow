import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/data/tour.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:pillow/route_config.dart';

import 'logic.dart';

class TourPage extends StatelessWidget {
  final logic = Get.put(TourLogic());
  final state = Get.find<TourLogic>().state;

  TourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background.png',
            alignment: Alignment.topCenter,

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
              text: '旅遊行程',
              activation: false,
            ),
          ),
          Positioned(
            top: 0.175.sh,
            child: SizedBox(
              height: 0.825.sh,
              width: 1.sw,
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var info = attractionMap[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                      child: Material(
                        elevation: 3,
                        shadowColor: Colors.black,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Ink.image(
                          fit: BoxFit.cover,
                          height: .235.sh,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.srcOver),
                          image: AssetImage(
                              info.imgUrl),
                          child: InkWell(
                            onTap: () {Get.toNamed(RouteConfig.travel, arguments: info);},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.black.withOpacity(0.2),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info.name,
                                style: TextStyle(
                                  height: 2.h,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                    // return Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextButton(
                    //       onPressed: () {},
                    //       child: Stack(
                    //         alignment: Alignment.center,
                    //         children: <Widget>[
                    //           Container(
                    //             foregroundDecoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(15.0),
                    //                 gradient: LinearGradient(
                    //                   begin: Alignment.centerLeft,
                    //                   end: Alignment.centerRight,
                    //                   colors: [
                    //                     Colors.black.withOpacity(0.5),
                    //                     Colors.transparent,
                    //                   ],
                    //                 )),
                    //             decoration: const BoxDecoration(
                    //               boxShadow: <BoxShadow>[
                    //                 BoxShadow(
                    //                     color: Colors.black54,
                    //                     blurRadius: 15.0,
                    //                     offset: Offset(0.0, 0.75))
                    //               ],
                    //             ),
                    //             child: ClipRRect(
                    //               borderRadius: BorderRadius.circular(15.0),
                    //               child: Image.asset(
                    //                 info.schedule[0].imgUrl,
                    //               ),
                    //             ),
                    //           ),
                    //           Positioned(
                    //             bottom: 20.h,
                    //             child: Text(
                    //               info.name,
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 40.sp,
                    //                   color: Colors.white),
                    //             ),
                    //           ),
                    //         ],
                    //       )),
                    // );
                  },
                  itemCount: attractionMap.length),
            ),
          ),

        ],
      ),
    );
  }
}
