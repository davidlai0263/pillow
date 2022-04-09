import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreState {
  late var credit = 0.obs;
  late List<int> coupon;

  StoreState() {
    credit.value = 0;
    coupon = [0, 0, 0, 0, 0, 0, 0];
  }
  initData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('credit') && prefs.containsKey('coupon')) {
      credit.value = prefs.getInt('credit')!;
      coupon = _stringListToIntList(prefs.getStringList('coupon')!);
      debugPrint('point : ${credit.value}');
      debugPrint('have : $coupon');
    } else {
      await prefs.setInt('credit', credit.value);
      await prefs.setStringList('coupon', _intListToStringList(coupon));
    }
  }

  saveCredit() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('credit', credit.value);
    debugPrint('saveCredit');
  }

  saveCoupon() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('coupon', _intListToStringList(coupon));
    debugPrint('saveCoupon');
  }

  _stringListToIntList(List<String> stringList) {
    List<int> intList = [];
    for (var element in stringList) {
      intList.add(int.parse(element));
    }
    return intList;
  }

  _intListToStringList(List<int> intList) {
    List<String> stringList = [];
    for (var element in intList) {
      stringList.add(element.toString());
    }
    return stringList;
  }

}


