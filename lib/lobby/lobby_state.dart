import 'package:flutter/material.dart';
import 'package:pillow/component/data/site.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LobbyState {
  late DateTime cooldown;
  late Site nearLocation;
  late bool availableChallenge;
  late List<bool> challengeSave;
  bool isClose = false;
  String location = '';

  LobbyState() {
    nearLocation = siteMap.first;
    availableChallenge = false;
    challengeSave = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
  }

  initData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('challengeSave')) {
      challengeSave =
          _stringListToBoolList(prefs.getStringList('challengeSave')!);
    } else {
      await prefs.setStringList(
          'challengeSave', _boolListToStringList(challengeSave));
    }
  }

  saveChallengeSave() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'challengeSave', _boolListToStringList(challengeSave));
    debugPrint('saveChallenge');
  }

  _stringListToBoolList(List<String> stringList) {
    List<bool> boolList = [];
    for (var element in stringList) {
      if (element == 'true') {
        boolList.add(true);
      } else {
        boolList.add(false);
      }
    }
    return boolList;
  }

  _boolListToStringList(List<bool> boolList) {
    List<String> stringList = [];
    for (var element in boolList) {
      if (element == true) {
        stringList.add('true');
      } else {
        stringList.add('false');
      }
    }
    return stringList;
  }
}
