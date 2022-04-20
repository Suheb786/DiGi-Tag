import 'package:digitag/app/modules/controllers/qr_scanner_controller.dart';
import 'package:digitag/app/modules/views/drawer_view.dart';
import 'package:digitag/app/modules/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:torch_controller/torch_controller.dart';

import '../../Decoration/colors/originBg.dart';

class QrScannerView extends GetView<QrScannerController> {
  QrScannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(DrawerView());
        controller.barcode.value = 'Profile will open when you scan a DiGi-Tag';

        return false;
      },
      child: Scaffold(
        //
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Builder(builder: (context) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  child: MobileScanner(
                      fit: BoxFit.cover,
                      allowDuplicates: false,
                      onDetect: (barcode, args) {
                        controller.barcode.value = barcode.rawValue!;

                        debugPrint('Barcode found! ${controller.barcode}');
                        if (controller.barcode.value!.startsWith("JIT")) {
                          Get.to(ProfileView());
                        }
                        // setState(() {
                        //   this.barcode = barcode.rawValue;
                        // });
                      }),
                ),
                Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    // FutureBuilder(
                    //     future: TorchController().isTorchActive,
                    //     builder: (_, snapshot) {
                    //       if (snapshot.connectionState == ConnectionState.done)
                    //         return Text(
                    //             'Is torch on? ${snapshot.data != null ? 'Yes!' : 'No :('}');

                    //       return Container();
                    //     }),
                    // MaterialButton(
                    //     child: Text('Toggle'),
                    //     onPressed: () {
                    //       TorchController().toggle(intensity: 1);
                    //     }),\

                    // IconButton(
                    //   onPressed: () {
                    //     print("object");
                    //   },
                    //   color: Colors.white,
                    //   icon: ValueListenableBuilder(
                    //     valueListenable: controller.cameraController.torchState,
                    //     builder: (context, state, child) {
                    //       switch (state as TorchState) {
                    //         case TorchState.off:
                    //           return const Icon(Icons.flash_off,
                    //               color: Colors.grey);
                    //         case TorchState.on:
                    //           return const Icon(Icons.flash_on,
                    //               color: Colors.yellow);
                    //       }
                    //     },
                    //   ),
                    //   iconSize: 32.0,
                    // ),
                    // //   ],
                    // // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5.2,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0x80ffffff), width: 4),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6.05,
                    ),
                    Container(
                      // alignment: Alignment.bottomCenter,
                      height: 120,
                      // color: Colors.black.withOpacity(0.4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width - 30,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                // gradient: BGColors.originalBackground,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.qr_code),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Scan DiGi-Tag',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              fontFamily: "Sofia"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                  controller.barcode.value ??
                                                      'Profile will open when you scan a DiGi-Tag',
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                              255, 5, 23, 54)
                                                          .withOpacity(0.7),
                                                      fontFamily: "Sofia")),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
