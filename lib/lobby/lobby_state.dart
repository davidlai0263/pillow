import 'package:pillow/component/data/site.dart';

class LobbyState {
  late Site nearLocation;
  late bool availableChallenge;

  LobbyState() {
    nearLocation = siteMap.first;
    availableChallenge = false;
  }
}
