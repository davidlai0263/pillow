import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillow/lobby/lobby_logic.dart';

class Coupon {
  final String image;
  final int point;
  final int have;
  final int money;

  const Coupon({required this.image, required this.point, required this.money, required this.have});
}

final lobbyState = Get.find<LobbyLogic>().state;

List coupon = [
  Coupon(
      image: 'assets/images/coupon_20.SVG',
      point: 6,
      money: 20,
      have: lobbyState.coupon[0]),
  Coupon(
      image: 'assets/images/coupon_60.SVG',
      point: 15,
      money: 60,
      have: lobbyState.coupon[1]),
  Coupon(
      image: 'assets/images/coupon_100.SVG',
      point: 20,
      money: 100,
      have: lobbyState.coupon[2]),
  Coupon(
      image: 'assets/images/coupon_150.SVG',
      point: 25,
      money: 150,
      have: lobbyState.coupon[3]),
  Coupon(
      image: 'assets/images/coupon_200.SVG',
      point: 30,
      money: 200,
      have: lobbyState.coupon[4]),
  Coupon(
      image: 'assets/images/coupon_350.SVG',
      point: 45,
      money: 350,
      have: lobbyState.coupon[5]),
];
