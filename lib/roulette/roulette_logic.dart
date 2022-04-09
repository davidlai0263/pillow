import 'dart:math';
import 'package:get/get.dart';
import 'roulette_state.dart';
import 'dart:async';

class RouletteLogic extends GetxController {
  final RouletteState state = RouletteState();
  final StreamController dividerController = StreamController<int>();
  final wheelNotifier = StreamController<double>();
  double generateRandomAngle() => Random().nextDouble() * pi * 2;
}
