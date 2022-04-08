import 'package:get/get.dart';
import 'bus/bus_view.dart';
import 'lobby/lobby_view.dart';
import 'question/question_view.dart';
import 'roulette/roulette_view.dart';
import 'rules/rules_view.dart';
import 'home/home_view.dart';
import 'store/store_view.dart';

class RouteConfig {
  static const String home = '/'; //首頁
  static const String rules = '/rules'; //玩法說明
  static const String bus = '/bus'; //公車時刻
  static const String lobby = '/lobby'; //開始遊戲
  static const String store = '/store'; //兌換商店
  static const String myCoupon = '/myCoupon'; //我的折價券
  static const String question = '/question'; //答題頁面
  static const String roulette = '/roulette'; //抽獎輪盤

  static final List<GetPage> getPages = [
    GetPage(
      name: home,
      page: () => HomePage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: rules,
      page: () => RulesPage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: bus,
      page: () => BusPage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: lobby,
      page: () => LobbyPage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: store,
      page: () => StorePage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: question,
      page: () => QuestionPage(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: roulette,
      page: () => RoulettePage(),
      transition: Transition.circularReveal,
    ),
  ];
}
