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
    distanceFilter: 50,
  );

  late StreamSubscription<Position> positionStream;
  late LocationPermission permission;

  Future openMapsSheet(
      context, String title, String description, Coords coords) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;

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
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
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
    debugPrint('onInitS');
    permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    debugPrint('$permission');

    state.initData();

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
          Get.snackbar(
            '',
            '',
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
                    if (state.nearLocation.distance >= 50) {
                      openMapsSheet(
                          Get.context,
                          state.nearLocation.name,
                          state.nearLocation.address,
                          state.nearLocation.coords);
                    }
                    else{
                      controller.stop();
                      positionStream.pause();
                      Get.toNamed(RouteConfig.question);
                    }
                    Get.closeAllSnackbars();
                  },
                  tag: '查看',
                  textColor: Colors.white,
                  text: '查看',
                  facWidth: 0.16,
                  facHeight: 0.05,
                  textSize: 14,
                  borderWidth: 1.5,
                  devWidth: 2.5,
                  devHeight: 2.5,
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
            margin: const EdgeInsets.symmetric(horizontal: .0),
            colorText: Colors.white,
            backgroundColor: Colors.grey.withOpacity(0.8),
          );
          debugPrint(
              '最近地點:${state.nearLocation.name} 距離:${state.nearLocation.distance}');
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
    debugPrint('onInitF');
    super.onInit();
  }

  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> animation = Tween<AlignmentGeometry>(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ),
  );

  @override
  void onReady() {
    debugPrint('onReady');
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    positionStream.cancel();
    debugPrint('onClose');
    super.onClose();
  }
}
