import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillow/component/doodle_btn/btn_view.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'logic.dart';

class TravelPage extends StatelessWidget {
  TravelPage({Key? key}) : super(key: key);
  final logic = Get.put(TravelLogic());
  final state = Get.find<TravelLogic>().state;

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
          const SliverWidget(),
          Positioned(
              bottom: .0,
              child: Container(
                color: const Color(0xffFFDEAD),
                height: .09.sh,
                width: 1.sw,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.0.h),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                      backgroundColor: const Color(0xff7D570B),
                      primary: const Color(0xFFFFFFFF),
                    ),
                    child: Text(
                      '立即購買',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class SliverWidget extends StatelessWidget {
  const SliverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return ScrollConfiguration(
      behavior: CustomScrollLobby(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Container(),
            bottom: PreferredSize(
              preferredSize: Size(0, 52.h),
              child: Container(
                height: 78.h,
                decoration: BoxDecoration(
                  color: const Color(0xffFFDEAD),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.r),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 17.h,
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
                      top: 9.5.h,
                      right: 110.w,
                      child: DoodleBtnWidget(
                        onTapUpCallback: () {},
                        facWidth: 0.365,
                        facHeight: 0.085,
                        text: '旅遊行程',
                        activation: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
            expandedHeight: .4.sh,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/background.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: FlexibleSpaceBar(
                    background: Image.asset(
                      '${data.coverUrl}',
                      width: 1.sw,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFFFFBFF),
              height: .185.sh,
              child: Center(
                child: Card(
                  elevation: 0,
                  color: const Color(0x247d570b),
                  margin: EdgeInsets.all(12.r),
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.explore_outlined,
                              color: const Color(0xff1E1B17),
                              size: 32.r,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '行程名稱：',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xff1E1B17),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data.name,
                              style: TextStyle(
                                color: const Color(0xff1E1B17),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.paid_outlined,
                              color: const Color(0xff1E1B17),
                              size: 32.r,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '行程費用：',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xff1E1B17),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data.price,
                              style: TextStyle(
                                color: const Color(0xff1E1B17),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: const Color(0xff1E1B17),
                              size: 32.r,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '建議人數：',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xff1E1B17),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data.suggest,
                              style: TextStyle(
                                color: const Color(0xff1E1B17),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFFFFBFF),
              child: Column(
                  children: data.schedule.asMap().entries.map<Widget>((e) {
                return Column(
                  children: [
                    TimelineTile(
                        isFirst: e.key == 0,
                        isLast: e.key == data.schedule.length - 1,
                        indicatorStyle: IndicatorStyle(
                          width: 18.r,
                          color: const Color(0xff536349),
                          indicatorXY: 0.0,
                          padding: EdgeInsets.fromLTRB(8.w, 8.w, 8.w, 8.w),
                          iconStyle: IconStyle(
                            fontSize: 14.r,
                            color: Colors.white,
                            iconData: Icons.circle,
                          ),
                        ),
                        alignment: TimelineAlign.manual,
                        lineXY: 0.18,
                        startChild: SizedBox(
                          height: 45.h,
                          child: Text(
                            e.value.time,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.blue[700]),
                          ),
                        ),
                        endChild: SizedBox(
                            height: 55.h,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: e.value.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold)),
                                const TextSpan(text: '\n'),
                                TextSpan(
                                    text: e.value.intro,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ))),
                    e.key != data.schedule.length - 1
                        ? TimelineTile(
                            hasIndicator: false,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.18,
                            endChild: Container(
                                color: const Color(0xFFFFFBFF),
                                height: .2.sh,
                                width: .1.sw,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(16.w, 0, 16.w, 4.h),
                                  child: Material(
                                    elevation: 2,
                                    shadowColor: Colors.grey,
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      '${e.value.imgUrl}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )))
                        : const SizedBox(),
                  ],
                );
              }).toList()),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: .07.sh,
              color: const Color(0xFFFFFBFF),
            ),
          )
        ],
      ),
    );
  }
}
