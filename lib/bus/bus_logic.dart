import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../component/webview.dart';
import 'bus_state.dart';

class BusLogic extends GetxController {
  final BusState state = BusState();
  final List sheets = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight'
  ];
  var busSheet = 'one'.obs;
  var busTime = true;
  var busRoute = true;
  var busID = 0;
  var timeTableUrl = '';
  var sheetTitle = '755 - 去程 - 上午'.obs;

  final BusInAppBrowser webView = BusInAppBrowser();
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  String getBusTimeTable(String listValue) {
    switch (listValue) {
      //755 - 去程
      case 'one':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=07550&rn=1652160864062';
        return timeTableUrl;
      case 'two':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=07550&rn=1652160864062';
        return timeTableUrl;
      //755 - 回程
      case 'three':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=07550&rn=1652160864062';
        return timeTableUrl;
      case 'four':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=07550&rn=1652160864062';
        return timeTableUrl;
      //綠15 - 去程
      case 'five':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=00150&rn=1652160927402';
        return timeTableUrl;
      case 'six':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=00150&rn=1652160927402';
        return timeTableUrl;
      //綠15 - 回程
      case 'seven':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=00150&rn=1652160927402';
        return timeTableUrl;
      case 'eight':
        timeTableUrl =
            'https://www.taiwanbus.tw/eBUSPage/Query/QueryResult.aspx?rno=00150&rn=1652160927402';
        return timeTableUrl;
      default:
        timeTableUrl = 'https://www.taiwanbus.tw/eBUSPage/default.aspx';
        return timeTableUrl;
    }
  }

  void setBusID(int id) {
    busID = id;
    setBusSheet(busID);
  }

  void setBusSheet(int id) {
    if (id == 0) {
      if (busRoute) {
        if (busTime) {
          busSheet.value = sheets[0];
          sheetTitle.value = '755 - 去程 - 上午';
        } else {
          busSheet.value = sheets[1];
          sheetTitle.value = '755 - 去程 - 下午';
        }
      } else {
        if (busTime) {
          busSheet.value = sheets[2];
          sheetTitle.value = '755 - 回程 - 上午';
        } else {
          busSheet.value = sheets[3];
          sheetTitle.value = '755 - 回程 - 下午';
        }
      }
    } else {
      if (busRoute) {
        if (busTime) {
          busSheet.value = sheets[4];
          sheetTitle.value = '綠15 - 去程 - 上午';
        } else {
          busSheet.value = sheets[5];
          sheetTitle.value = '綠15 - 去程 - 下午';
        }
      } else {
        if (busTime) {
          busSheet.value = sheets[6];
          sheetTitle.value = '綠15 - 回程 - 上午';
        } else {
          busSheet.value = sheets[7];
          sheetTitle.value = '綠15 - 回程 - 下午';
        }
      }
    }
    update();
  }

  void setBusTime() {
    busTime = !busTime;
    setBusSheet(busID);
  }

  void setBusRoute() {
    busRoute = !busRoute;
    setBusSheet(busID);
  }
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
