import 'dart:ffi';

import 'package:digitag/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import '../controllers/drawer_controller.dart';

class DrawerView extends GetView<Drawer_Controller> {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      angle: 0,
      borderRadius: 42,
      slideWidth: 120,
      // isRtl: false,
      style: DrawerStyle.Style1,
      mainScreen: HomeView(),
      menuScreen: const MenuPage(),
    );
  }
}

class MenuItems {
  static final beststdnt = MenuItem(Icons.abc_outlined);
  static final editprfl = MenuItem(Icons.abc_outlined);
  static final showqr = MenuItem(Icons.abc_outlined);
  static final shareprfl = MenuItem(Icons.abc_outlined);

  static List<MenuItem> all = <MenuItem>[
    beststdnt,
    editprfl,
    showqr,
    shareprfl,
  ];
}

class MenuItem {
  final IconData icon;
  MenuItem(this.icon);
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Color(0xff2BBDC7), Color(0xff2E48A7)],
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        onTap: () {},
      );
}
