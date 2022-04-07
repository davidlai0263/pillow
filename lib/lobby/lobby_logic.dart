import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../component/data/site.dart';
import '../component/doodle_btn/btn_view.dart';
import 'lobby_state.dart';

class LobbyLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final LobbyState state = LobbyState();
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 10,
  );

  late StreamSubscription<Position> positionStream;
  late LocationPermission permission;

  @override
  Future<void> onInit() async {
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    debugPrint('$permission');

    state.initData();

    if (permission == LocationPermission.denied ||
    permission == LocationPermission.deniedForever) {
      await Get.defaultDialog(
          title: '提醒！',
          middleText: '請同意存取位置權限，才可進行挑戰。',
          middleTextStyle:  TextStyle(
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
    if (permission != LocationPermission.denied && permission != LocationPermission.deniedForever) {
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
        }
      });
    } else {
      await Get.defaultDialog(
          title: '提醒！',
          middleText: '請進入設定開啟位置存取權限，才可進行挑戰。',
          middleTextStyle:  TextStyle(
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

      if(GetPlatform.isIOS){
        await Geolocator.openLocationSettings();
      }else{
        await Geolocator.openAppSettings();
      }

    }
    super.onInit();
  }


  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> animation = Tween<AlignmentGeometry>(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );
  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
