import 'package:flutter/material.dart';
import 'package:flutter_web_test/helpers/responsiveness.dart';
import 'package:flutter_web_test/widgets/larg_screen.dart';
import 'package:flutter_web_test/widgets/medium_screen.dart';
import 'package:flutter_web_test/widgets/side_menu.dart';
import 'package:flutter_web_test/widgets/small_screen.dart';
import 'package:flutter_web_test/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      appBar: topNavigationBar(context, scaffoldKey),
      key: scaffoldKey,
      drawer: const Drawer(child: SideMenu()),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: MediumScreen(),
      ),
    );
  }
}
