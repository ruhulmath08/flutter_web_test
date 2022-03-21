import 'package:flutter/material.dart';
import 'package:flutter_web_test/constants/style.dart';
import 'package:flutter_web_test/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find(); //allow to access the MenuController from anywhere
  var activeItem = overViewPageRoute.obs;
  var hoverItem = ''.obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  bool isActive(String itemName) => activeItem.value == itemName;
  bool isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case driversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData iconData, String itemName) {
    if (isActive(itemName)) {
      return Icon(iconData, size: 22, color: dark);
    } else {
      return Icon(
        iconData,
        size: 22,
        color: isHovering(itemName) ? dark : light,
      );
    }
  }
}
