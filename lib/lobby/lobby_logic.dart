import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      debugPrint(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });

    super.onInit();
  }
}
