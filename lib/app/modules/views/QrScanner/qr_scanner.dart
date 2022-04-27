import 'package:digitag/app/modules/views/Drawer/drawer_view.dart';
import 'package:digitag/app/modules/views/QrScanner/qr_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

import '../Profile/profile_view.dart';

class QrScannerView extends GetView<QrScannerController> {
  @override
  QrScannerController controller = Get.put(QrScannerController());
  QrScannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (Get.isSnackbarOpen) {
            Get.closeCurrentSnackbar();
          }
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          Get.offAll(DrawerView());
          controller.barcode.value =
              'Profile will open when you scan a DiGi-QR';

          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Builder(builder: (context) {
            return Stack(
              children: [
                MobileScanner(
                  controller: controller.cameracontroller,
                  fit: BoxFit.cover,
                  allowDuplicates: false,
                  onDetect: (barcode, args) {
                    controller.barcode.value = barcode.rawValue!;

                    debugPrint('Barcode found! ${controller.barcode}');
                    if (controller.barcode.value!.startsWith("JIT")) {
                      Get.off(ProfileView());
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Profile Found'),
                        backgroundColor: Colors.green,
                      ));
                    } else {
                      Get.snackbar(
                          "Not Found", "Please try again on a valid Digi-QR   ",
                          dismissDirection: DismissDirection.horizontal,
                          messageText: Text(
                            "Please try again on a valid Digi-QR  ",
                            style: GoogleFonts.montserrat(color: Colors.white),
                          ),
                          titleText: Text(
                            "Not Found",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          borderRadius: 5,
                          duration: Duration(seconds: 5),
                          colorText: Colors.white,
                          backgroundColor: Colors.red);

                      // ));
                    }
                  },
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9.2,
                    ),
                    Text(
                      "Supports",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 12),
                    ),
                    Text("DiGi-Tag",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Sofia",
                            fontSize: 30)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 11.2,
                    ),
                    Container(
                      height: 270,
                      width: 270,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0x80ffffff), width: 4),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10.05,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => Container(
                            height: 190,
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 22,
                                      ),
                                      const Icon(
                                        Icons.qr_code_rounded,
                                        color: Colors.black54,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Text(
                                        'Scan QR',
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            fontFamily: "Sofia"),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 37,
                                        width: 37,
                                        decoration: BoxDecoration(
                                            color: Color(0xff647C99),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 3,
                                                color: Color(0xffB2C1D3))),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            // color: Colors.white,
                                            child: const Icon(
                                              Icons.image_search,
                                              size: 19,
                                              color: Colors.white,
                                            ),

                                            onTap: () async {
                                              final ImagePicker _picker =
                                                  ImagePicker();
                                              // Pick an image
                                              final XFile? image =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (image != null) {
                                                if (await controller
                                                    .cameracontroller
                                                    .analyzeImage(image.path)) {
                                                  if (controller.barcode.value!
                                                      .startsWith("JIT")) {
                                                    Get.to(ProfileView());
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        'Profile Found',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ));
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Text(
                                                      'No DiGi-QR found!',
                                                      style: GoogleFonts
                                                          .montserrat(),
                                                    ),
                                                    backgroundColor: Colors.red,
                                                  ));
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Container(
                                        height: 37,
                                        width: 37,
                                        decoration: BoxDecoration(
                                            color: Color(0xff647C99),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 3,
                                                color: Color(0xffB2C1D3))),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            child: ValueListenableBuilder(
                                              valueListenable: controller
                                                  .cameracontroller.torchState,
                                              builder: (context, state, child) {
                                                switch (state as TorchState) {
                                                  case TorchState.off:
                                                    return const Icon(
                                                        Icons.flash_off,
                                                        size: 19,
                                                        color: Colors.white);
                                                  case TorchState.on:
                                                    return const Icon(
                                                        Icons.flash_on,
                                                        size: 19,
                                                        color: Colors.yellow);
                                                }
                                              },
                                            ),
                                            onTap: () => controller
                                                .cameracontroller
                                                .toggleTorch(),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(1, 9),
                                                  blurRadius: 30,
                                                  spreadRadius: 0)
                                            ]),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Flexible(
                                              child: Text(
                                                  controller.barcode.value ??
                                                      'Profile will open when you scan a DiGi-QR',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                              255, 5, 23, 54)
                                                          .withOpacity(0.7),
                                                      fontFamily: "Sofia")),
                                            ),
                                          ),
                                        ),
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
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     alignment: Alignment.bottomCenter,
                //     height: 100,
                //     color: Colors.black.withOpacity(0.4),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         IconButton(
                //           color: Colors.white,
                //           icon: ValueListenableBuilder(
                //             valueListenable: cameracontroller.torchState,
                //             builder: (context, state, child) {
                //               switch (state as TorchState) {
                //                 case TorchState.off:
                //                   return const Icon(Icons.flash_off,
                //                       color: Colors.grey);
                //                 case TorchState.on:
                //                   return const Icon(Icons.flash_on,
                //                       color: Colors.yellow);
                //               }
                //             },
                //           ),
                //           iconSize: 32.0,
                //           onPressed: () => cameracontroller.toggleTorch(),
                //         ),
                //         Center(
                //           child: SizedBox(
                //             width: MediaQuery.of(context).size.width - 200,
                //             height: 50,
                //             child: FittedBox(
                //               child: Text(
                //                 barcode ?? 'Scan something!',
                //                 overflow: TextOverflow.fade,
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .headline4!
                //                     .copyWith(color: Colors.white),
                //               ),
                //             ),
                //           ),
                //         ),
                //         IconButton(
                //           color: Colors.white,
                //           icon: const Icon(Icons.image),
                //           iconSize: 32.0,
                //           onPressed: () async {
                //             final ImagePicker _picker = ImagePicker();
                //             // Pick an image
                //             final XFile? image = await _picker.pickImage(
                //                 source: ImageSource.gallery);
                //             if (image != null) {
                //               if (await cameracontroller
                //                   .analyzeImage(image.path)) {
                //                 ScaffoldMessenger.of(context)
                //                     .showSnackBar(const SnackBar(
                //                   content: Text('Barcode found!'),
                //                   backgroundColor: Colors.green,
                //                 ));
                //               } else {
                //                 ScaffoldMessenger.of(context)
                //                     .showSnackBar(const SnackBar(
                //                   content: Text('No barcode found!'),
                //                   backgroundColor: Colors.red,
                //                 ));
                //               }
                //             }
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            );
          }),
        ));
  }
}





























//* Previous qr scanner code 
//! scan detection working
//! navigat after detection working 
//! only scan when JIT prefix available working 


// import 'package:digitag/app/modules/controllers/qr_scanner_controller.dart';
// import 'package:digitag/app/modules/views/drawer_view.dart';
// import 'package:digitag/app/modules/views/profile/profile_view.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// import '../../Decoration/colors/originBg.dart';

// class QrScannerView extends GetView<QrScannerController> {
//   QrScannerView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Get.offAll(DrawerView());
//         controller.barcode.value = 'Profile will open when you scan a DiGi-Tag';

//         return false;
//       },
//       child: Scaffold(
//         //
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Builder(builder: (context) {
//             return Stack(
//               children: [
//                 Positioned(
//                   bottom: 0.0,
//                   child: MobileScanner(
//                       fit: BoxFit.cover,
//                       allowDuplicates: false,
//                       onDetect: (barcode, args) {
//                         controller.barcode.value = barcode.rawValue!;

//                         debugPrint('Barcode found! ${controller.barcode}');
//                         if (controller.barcode.value!.startsWith("JIT")) {
//                           Get.to(ProfileView());
//                         }
//                         // setState(() {
//                         //   this.barcode = barcode.rawValue;
//                         // });
//                       }),
//                 ),
//                 Column(
//                   children: [
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     //   children: [
//                     // FutureBuilder(
//                     //     future: TorchController().isTorchActive,
//                     //     builder: (_, snapshot) {
//                     //       if (snapshot.connectionState == ConnectionState.done)
//                     //         return Text(
//                     //             'Is torch on? ${snapshot.data != null ? 'Yes!' : 'No :('}');

//                     //       return Container();
//                     //     }),
//                     // MaterialButton(
//                     //     child: Text('Toggle'),
//                     //     onPressed: () {
//                     //       TorchController().toggle(intensity: 1);
//                     //     }),\

//                     // IconButton(
//                     //   onPressed: () {
//                     //     print("object");
//                     //   },
//                     //   color: Colors.white,
//                     //   icon: ValueListenableBuilder(
//                     //     valueListenable: controller.cameraController.torchState,
//                     //     builder: (context, state, child) {
//                     //       switch (state as TorchState) {
//                     //         case TorchState.off:
//                     //           return const Icon(Icons.flash_off,
//                     //               color: Colors.grey);
//                     //         case TorchState.on:
//                     //           return const Icon(Icons.flash_on,
//                     //               color: Colors.yellow);
//                     //       }
//                     //     },
//                     //   ),
//                     //   iconSize: 32.0,
//                     // ),
//                     // //   ],
//                     // // ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 5.2,
//                     ),
//                     Container(
//                       height: 300,
//                       width: 300,
//                       decoration: BoxDecoration(
//                           border:
//                               Border.all(color: Color(0x80ffffff), width: 4),
//                           borderRadius: BorderRadius.circular(20)),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 6.05,
//                     ),
//                     Container(
//                       // alignment: Alignment.bottomCenter,
//                       height: 120,
//                       // color: Colors.black.withOpacity(0.4),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Obx(
//                             () => Container(
//                               height: 200,
//                               width: MediaQuery.of(context).size.width - 30,
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.9),
//                                 // gradient: BGColors.originalBackground,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Icon(Icons.qr_code),
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           'Scan DiGi-Tag',
//                                           overflow: TextOverflow.fade,
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black54,
//                                               fontFamily: "Sofia"),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15.0),
//                                         child: Row(
//                                           children: [
//                                             Flexible(
//                                               child: Text(
//                                                   controller.barcode.value ??
//                                                       'Profile will open when you scan a DiGi-Tag',
//                                                   overflow: TextOverflow.fade,
//                                                   style: TextStyle(
//                                                       fontSize: 14,
//                                                       color: Color.fromARGB(
//                                                               255, 5, 23, 54)
//                                                           .withOpacity(0.7),
//                                                       fontFamily: "Sofia")),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10)
//                   ],
//                 ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
