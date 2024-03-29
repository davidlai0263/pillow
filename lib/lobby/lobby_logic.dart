import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pillow/route_config.dart';

import '../component/data/site.dart';
import '../component/doodle_btn/btn_view.dart';
import 'lobby_state.dart';

class LobbyLogic extends GetxController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver {
  final LobbyState state = LobbyState();
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 10,
  );

  late StreamSubscription<Position> positionStream;
  late LocationPermission permission;

  Future openMapsSheet(
      context, String title, String description, Coords coords) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;
      Get.closeAllSnackbars();
      Get.bottomSheet(
          SafeArea(
            child: SingleChildScrollView(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    InkWell(
                      borderRadius: BorderRadius.circular(16.r),
                      onTap: () => {
                        map.showMarker(
                          title: title,
                          description: description,
                          coords: coords,
                        ),
                        Get.back()
                      },
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.fromLTRB(22.w, 10.w, .0, 10.w),
                        title: Text(
                          map.mapName,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.r,
                          width: 30.r,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white.withOpacity(0.8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))));
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Future<void> onInit() async {
    debugPrint('LobbyOnInitS');
    Get.closeAllSnackbars();
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    debugPrint('permission: $permission');

    state.initData();
    state.cooldown = DateTime.utc(1900);

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Get.defaultDialog(
          title: '提醒！',
          middleText: '請同意存取位置權限，才可進行挑戰。',
          middleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.sp),
          titlePadding: EdgeInsets.fromLTRB(0, 13.h, 0, .5.h),
          titleStyle: TextStyle(
              fontSize: 22.sp, height: 1.5, fontWeight: FontWeight.bold),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.0.w),
          backgroundColor: Colors.yellow.shade300.withOpacity(0.85),
          confirm: DoodleBtnWidget(
            tag: 'go to argent gps request',
            text: '點選同意',
            textSize: 18,
            onTapUpCallback: () {
              Get.back();
            },
          ));

      permission = await Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever) {
      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) {
        debugPrint(position == null
            ? 'Unknown'
            : '${position.latitude.toString()}, ${position.longitude.toString()}');

        if (position != null) {
          //update site distance
          for (var element in siteMap) {
            element.distance = Geolocator.distanceBetween(
                    position.latitude,
                    position.longitude,
                    element.coords.latitude,
                    element.coords.longitude)
                .abs();
          }
          //find near site
          for (var element in siteMap) {
            if (element.distance < state.nearLocation.distance) {
              state.nearLocation = element;
            }
          }
          debugPrint(
              '最近地點:${state.nearLocation.name} 距離:${state.nearLocation.distance}');
          update();
          //coolDown
          debugPrint(
              '${DateTime.now().difference(state.cooldown).inSeconds}秒');
          if (DateTime.now().difference(state.cooldown).inSeconds > 8) {
            Get.snackbar(
              '',
              '',
              animationDuration: const Duration(milliseconds: 500),
              forwardAnimationCurve: Curves.easeInOutBack,
              borderRadius: 28.r,
              titleText: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '您正在前往...',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  DoodleBtnWidget(
                    onTapUpCallback: () {
                      Get.closeAllSnackbars();
                      if (state.nearLocation.distance >= 50) {
                        openMapsSheet(
                            Get.context,
                            state.nearLocation.name,
                            state.nearLocation.address,
                            state.nearLocation.coords);
                      } else {
                        introDialog();
                      }
                    },
                    tag: '查看',
                    textColor: Colors.white,
                    text: '查看',
                    facWidth: 0.16,
                    facHeight: 0.05,
                    textSize: 14,
                    borderWidth: 2,
                    devWidth: 2,
                    devHeight: 2,
                    borderRadius: 12,
                    backgroundColor: const Color(0xffacacac),
                  )
                ],
              ),
              messageText: RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    text: '距離您最近的地點「',
                    children: [
                      TextSpan(
                        text: state.nearLocation.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: '」，還有'),
                      TextSpan(
                        text: '${state.nearLocation.distance.toInt()}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: '公尺。',
                      )
                    ]),
              ),
              duration: const Duration(seconds: 5),
              colorText: Colors.white,
              backgroundColor: Colors.grey.withOpacity(0.8),
            );
            state.cooldown = DateTime.now();
            // debugPrint(
            //     '最近地點:${state.nearLocation.name} 距離:${state.nearLocation.distance}');
          }
        }
      });
    } else {
      await Get.defaultDialog(
          title: '提醒！',
          middleText: '請進入設定開啟位置存取權限，才可進行挑戰。',
          middleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.sp),
          titlePadding: EdgeInsets.fromLTRB(0, 13.h, 0, .5.h),
          titleStyle: TextStyle(
              fontSize: 22.sp, height: 1.5, fontWeight: FontWeight.bold),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.0.w),
          backgroundColor: Colors.yellow.shade300.withOpacity(0.85),
          confirm: DoodleBtnWidget(
            tag: 'go to setting',
            text: '前往設定',
            textSize: 18,
            onTapUpCallback: () {
              Get.back();
            },
          ));

      if (GetPlatform.isIOS) {
        await Geolocator.openLocationSettings();
      } else {
        await Geolocator.openAppSettings();
      }
    }
    debugPrint('lobbyOnInitF');
    super.onInit();
  }

  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 750),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> animation = Tween<AlignmentGeometry>(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ),
  );

  Future<dynamic> introDialog() {
    return Get.defaultDialog(
      title: state.nearLocation.name,
      barrierDismissible: false,
      radius: 24.r,
      titlePadding: EdgeInsets.fromLTRB(.0, 14, .0, 14.h),
      titleStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      backgroundColor: Colors.yellow.shade300.withOpacity(0.85),
      content: Column(
        children: [
          GestureDetector(
            child: Image.asset(
              state.nearLocation.imagePath,
            ),
            onTap: () {
              Get.dialog(Center(
                child: InteractiveViewer(
                  child: Image.asset(
                    state.nearLocation.imagePath,
                  ),
                ),
              ));
            },
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 0.325.sh,
            ),
            width: 1.sw,
            color: const Color(0xb3af8337),
            child: ScrollConfiguration(
              behavior: CustomScrollLobby(),
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 8.w, 12.w, 8.w),
                      child: Text(
                        state.nearLocation.intro,
                        style: TextStyle(
                            fontSize: 18.sp, wordSpacing: 1.25.sp, height: 1.5),
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoodleBtnWidget(
                tag: 'introCancel',
                onTapUpCallback: () async {
                  Get.closeAllSnackbars();
                  Get.back();
                },
                text: '取消',
                textSize: 14,
                facWidth: 0.2,
                facHeight: 0.055,
                borderWidth: 2.5,
                borderRadius: 12,
                devWidth: 1.25,
                devHeight: 1.25,
              ),
              DoodleBtnWidget(
                tag: 'introSure',
                onTapUpCallback: () async {
                  Get.closeAllSnackbars();
                  Get.back();
                  if (state.challengeSave[state.nearLocation.index] == false) {
                    Get.toNamed(RouteConfig.question);
                  } else {
                    Get.snackbar(
                      '',
                      '',
                      animationDuration: const Duration(milliseconds: 500),
                      titleText: Text(
                        '挑戰已完成：',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      messageText: Text(
                        '請前往下個地點。',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      margin: EdgeInsets.symmetric(vertical: 18.h),
                      borderRadius: 32.r,
                      duration: const Duration(milliseconds: 1500),
                      backgroundColor: Colors.black38,
                      snackPosition: SnackPosition.BOTTOM,
                      maxWidth: 0.45.sw,
                    );
                  }
                },
                text: '挑戰',
                textSize: 14,
                facWidth: 0.2,
                facHeight: 0.055,
                borderWidth: 2.5,
                borderRadius: 12,
                devWidth: 1.25,
                devHeight: 1.25,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void onReady() {
    debugPrint('lobbyOnReady');
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    positionStream.cancel();
    Get.closeAllSnackbars();
    debugPrint('lobbyOnClose');
    super.onClose();
  }
}

class CustomScrollLobby extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
