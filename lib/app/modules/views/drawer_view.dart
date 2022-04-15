import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import 'home_view.dart';
import 'login_view.dart';
import 'profile/profile_view.dart';

class DrawerView extends GetView<MyDrawerController> {
  int? screen;

  DrawerView({
    Key? key,
    this.screen = 0,
  }) : super(key: key);
  MenuItem currentItem = MenuItems.editprfl;
  // Widget drawermenu;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(builder: (controller) {
      return ZoomDrawer(
        controller: controller.zoomDrawerController,
        angle: 0,
        boxShadow: const [
          BoxShadow(
              color: Color(0x66000000),
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
        mainScreen: getMainScreen(screen ?? 0),
        menuScreen: MenuPage(onSelectedItem: (item) {}),
      );
    });
  }
}

Widget getMainScreen(int screen) {
  return Builder(builder: (context) {
    switch (screen) {
      case 0:
        return HomeView();

      case 1:
        return ProfileView();

      default:
        return HomeView();
    }
  });
}

class MenuItems {
  static final home = MenuItem(
    Icons.home,
    "Home",
  );
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
    home,
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff2BBDC7), Color(0xff2E48A7)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 3,
              ),
              ...MenuItems.all.map(buildMenuItem).toList(),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  const SizedBox(width: 25),
                  InkWell(
                    onTap: (() => Get.to(LoginView())),
                    child: const Text(
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
              const SizedBox(
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
          style: const TextStyle(
              color: Color(0xff9FDDFF),
              fontFamily: 'Sofia',
              fontSize: 13,
              letterSpacing: 1.2),
        ),
        onTap: () {
          // switch (item.title) {
          //   case "Profile":
          //     {
          //       Get.to(ProfileView());
          //     }
          //     break;
          //   case "JIT Elites":
          //     {
          //       Get.to(LoginView());
          //     }
          //     break;
          //   case "Show QR":
          //     {
          //       Get.to(ProfileView());
          //     }
          //     break;
          // }
          debugPrint("dekho ${item.title}");
          onSelectedItem(item);
          switch (item.title) {
            case "Home":
              Get.offAll(DrawerView(
                screen: 0,
              ));
              break;
            case "Profile":
              Get.offAll(DrawerView(
                screen: 1,
              ));
              break;
            default:
          }
        },
      );
}
