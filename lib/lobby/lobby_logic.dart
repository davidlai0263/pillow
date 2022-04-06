import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../component/doodle_btn/btn_view.dart';
import 'lobby_state.dart';

class LobbyLogic extends GetxController {
  final LobbyState state = LobbyState();
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  late StreamSubscription<Position> positionStream;
  late LocationPermission permission;

  @override
  Future<void> onInit() async {
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      await Get.defaultDialog(
          title: '提醒！',
          middleText: '請同意存取位置權限，才可進行挑戰。',
          titlePadding: EdgeInsets.symmetric(vertical: 8.h),
          titleStyle: TextStyle(
              fontSize: 20.sp, height: 1.5, fontWeight: FontWeight.bold),
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

    if (await Geolocator.checkPermission() != LocationPermission.denied) {
      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) {
        debugPrint(position == null
            ? 'Unknown'
            : '${position.latitude.toString()}, ${position.longitude.toString()}');
      });
    } else {
      await Get.defaultDialog(
          title: '提醒！',
          middleText: '請進入設定開啟位置存取權限，才可進行跳站。',
          titlePadding: EdgeInsets.symmetric(vertical: 8.h),
          titleStyle: TextStyle(
              fontSize: 20.sp, height: 1.5, fontWeight: FontWeight.bold),
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
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
    }

    super.onInit();
  }
}
