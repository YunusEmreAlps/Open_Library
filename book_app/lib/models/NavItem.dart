// Libraries
import 'package:book_app/views/main_screen.dart';
import 'package:flutter/material.dart';

class NavItem {
  final int id;
  final String icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void chnageNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: "assets/icons/shop.svg",
      destination: MainScreen(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/heart.svg",
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/chat.svg",
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/user.svg",
    ),
  ];
}
