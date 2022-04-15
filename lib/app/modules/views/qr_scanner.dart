import 'package:digitag/app/modules/controllers/qr_scanner_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../Decoration/colors/originBg.dart';

class QrScannerView extends GetView<QrScannerController> {
  QrScannerView({Key? key}) : super(key: key);
  QrScannerController controller = Get.put(QrScannerController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        controller.barcode.value = "Student Digi-ID will be visible here";
        // controller.barcode.value == ""
        //     ? controller.barcode.value = "data"
        //     : controller.barcode.value = " data 2";
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Builder(builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                  fit: BoxFit.contain,
                  // allowDuplicates: false,
                  onDetect: (barcode, args) {
                    controller.barcode.value = barcode.rawValue!;
                    // setState(() {
                    //   this.barcode = barcode.rawValue;
                    // });
                  }),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 1.5,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0x80ffffff), width: 4),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6.05,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 120,
                    // color: Colors.black.withOpacity(0.4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(() => Container(
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
                                        child: Text(
                                            controller.barcode.value ??
                                                'Student Digi-ID will be visible here',
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black45
                                                    .withOpacity(0.5),
                                                fontFamily: "Sofia")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
