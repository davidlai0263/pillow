import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillow/lobby/lobby_logic.dart';

class Coupon {
  final ImageProvider image;
  final int point;
  final int have;
  final int money;

  const Coupon({required this.image, required this.point, required this.money, required this.have});
}

final lobbyState = Get.find<LobbyLogic>().state;

List coupon = [
  Coupon(
      image: const AssetImage('assets/images/coupon1.png'),
      point: 6,
      money: 20,
      have: lobbyState.coupon[0]),
  Coupon(
      image: const AssetImage('assets/images/coupon2.png'),
      point: 15,
      money: 60,
      have: lobbyState.coupon[1]),
  Coupon(
      image: const AssetImage('assets/images/coupon3.png'),
      point: 20,
      money: 100,
      have: lobbyState.coupon[2]),
  Coupon(
      image: const AssetImage('assets/images/coupon4.png'),
      point: 25,
      money: 150,
      have: lobbyState.coupon[3]),
  Coupon(
      image: const AssetImage('assets/images/coupon5.png'),
      point: 30,
      money: 200,
      have: lobbyState.coupon[4]),
  Coupon(
      image: const AssetImage('assets/images/coupon6.png'),
      point: 45,
      money: 350,
      have: lobbyState.coupon[5]),
];
