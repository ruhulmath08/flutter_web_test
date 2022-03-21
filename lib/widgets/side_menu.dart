import 'package:flutter/material.dart';
import 'package:flutter_web_test/constants/style.dart';
import 'package:flutter_web_test/helpers/responsiveness.dart';
import 'package:flutter_web_test/widgets/custom_text.dart';
import 'package:flutter_web_test/widgets/side_menu_item.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(height: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Image.asset('assets/icons/logo.png'),
                    ),
                    Flexible(
                      child: CustomText(
                        text: 'Dash',
                        size: 20,
                        widget: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(height: _width / 48),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 40),
          Divider(color: lightGrey.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItem
                .map(
                  (itemName) => SideMenuItem(
                    itemName: itemName == authenticationPageRoute ? 'Log Out' : itemName,
                    onTap: () {
                      if (itemName == authenticationPageRoute) {
                        //todo: go to authentication page
                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveItemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        //todo: go to item name route
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
