import 'package:pillow/component/data/site.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LobbyState {
  late Site nearLocation;
  late bool availableChallenge;
  late List<bool> challengeSave;
  late int credit;
  late List<int> coupon;
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
      false
    ];
    credit = 0;
    coupon = [0, 0, 0, 0, 0, 0, 0];
  }

  initData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('challengeSave') && prefs.containsKey('credit')) {
      challengeSave =
          _stringListToBoolList(prefs.getStringList('challengeSave')!);
      credit = prefs.getInt('credit')!;
      coupon = _stringListToIntList(prefs.getStringList('coupon')!);
    } else {
      await prefs.setStringList(
          'challengeSave', _boolListToStringList(challengeSave));
      await prefs.setInt('credit', credit);
      await prefs.setStringList('coupon', _intListToStringList(coupon));
    }
  }

  saveChallengeSave() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'challengeSave', _boolListToStringList(challengeSave));
  }

  saveCredit() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('credit', credit);
  }

  saveCoupon() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('coupon', _intListToStringList(coupon));
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
