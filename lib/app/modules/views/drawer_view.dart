import 'package:digitag/app/modules/controllers/home_controller.dart';
import 'package:digitag/app/modules/views/home_view.dart';
import 'package:digitag/app/modules/views/login_view.dart';
import 'package:digitag/app/modules/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';

import '../controllers/drawer_controller.dart';

class DrawerView extends GetView<Drawer_Controller> {
  DrawerView({Key? key}) : super(key: key);
  final _drawerController = ZoomDrawerController();
  HomeController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ZoomDrawer(
      controller: _drawerController,
      angle: 0,
      boxShadow: [
        BoxShadow(
            color: Color(0x660000000),
            offset: Offset(10, 4),
            blurRadius: 20.0,
            spreadRadius: 0.0)
      ],
      borderRadius: 42,
      slideWidth: 200,
      isRtl: false,
      showShadow: true,
      shadowLayer1Color: Colors.white.withOpacity(0.1),
      shadowLayer2Color: Colors.white.withOpacity(0.15),
      style: DrawerStyle.Style1,
      mainScreen: _controller.openclosetype.value == "home" ||
              _controller.openclosetype.isEmpty
          ? HomeView()
          : ProfileView(),
      menuScreen: MenuPage(onSelectedItem: (item) {}),
    ));
  }
}

class MenuItems {
  static final beststdnt = MenuItem(
    Icons.person_rounded,
    'Profile',
  );
  static final editprfl = MenuItem(
    Icons.star_rounded,
    'JIT Elites',
  );
  static final showqr = MenuItem(
    Icons.qr_code_2_rounded,
    'Show QR',
  );
  static final shareprfl = MenuItem(Icons.share_rounded, 'Share Profile');

  static List<MenuItem> all = <MenuItem>[
    beststdnt,
    editprfl,
    showqr,
    shareprfl,
  ];
}

class MenuItem {
  final String title;
  final IconData icon;
  MenuItem(
    this.icon,
    this.title,
  );
}

class MenuPage extends StatelessWidget {
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.onSelectedItem,
  }) : super(
          key: key,
        );

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
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 3,
              ),
              ...MenuItems.all.map(buildMenuItem).toList(),
              Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  SizedBox(width: 25),
                  InkWell(
                    onTap: (() => Get.to(LoginView())),
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: 'Sofia',
                          fontSize: 12,
                          color: Color(0xffB6C8FF)),
                    ),
                  ),
                  Transform.rotate(
                    angle: -1.57,
                    child: Container(
                      color: Color(0xff5B76C8),
                      width: 23,
                      height: 2,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: "Contact ",
                        style: TextStyle(
                            fontFamily: 'Sofia',
                            letterSpacing: 1,
                            fontSize: 12,
                            color: Color(0xffB6C8FF)),
                      ),
                      TextSpan(
                        text: "SoftKru",
                        style: TextStyle(
                            fontFamily: 'Sofia',
                            letterSpacing: 1,
                            fontSize: 12,
                            color: Color(0xffFF8CD1)),
                      ),
                    ])),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        minLeadingWidth: 20,
        selectedTileColor: Colors.white,
        leading: Icon(
          item.icon,
          size: 22,
          color: Color(0xff9FDDFF),
        ),
        title: Text(
          item.title,
          style: TextStyle(
              color: Color(0xff9FDDFF),
              fontFamily: 'Sofia',
              fontSize: 13,
              letterSpacing: 1.2),
        ),
        onTap: () {
          switch (item.title) {
            case "Profile":
              {
                Get.to(ProfileView());
              }
              break;
            case "JIT Elites":
              {
                Get.to(LoginView());
              }
              break;
            case "Show QR":
              {
                Get.to(ProfileView());
              }
              break;
          }
          debugPrint("dekho ${item.title}");
          onSelectedItem(item);
        },
      );
}
