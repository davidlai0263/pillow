import 'package:get/get.dart';
import 'package:pillow/lobby/lobby_logic.dart';

class Coupon {
  final String image;
  final int point;
  final int gift;
  final int index;

  const Coupon({required this.image, required this.point, required this.gift, required this.index});
}

final lobbyState = Get.find<LobbyLogic>().state;

List coupon = [
  const Coupon(
    image: 'assets/images/coupon_20.SVG',
    point: 6,
    gift: 20,
    index: 0,
  ),
  const Coupon(
    image: 'assets/images/coupon_60.SVG',
    point: 15,
    gift: 60,
    index: 1,
  ),
  const Coupon(
    image: 'assets/images/coupon_100.SVG',
    point: 20,
    gift: 100,
    index: 2,
  ),
  const Coupon(
    image: 'assets/images/coupon_150.SVG',
    point: 25,
    gift: 150,
    index: 3,
  ),
  const Coupon(
    image: 'assets/images/coupon_200.SVG',
    point: 30,
    gift: 200,
    index: 4,
  ),
  const Coupon(
    image: 'assets/images/coupon_350.SVG',
    point: 45,
    gift: 350,
    index: 5,
  ),
];
