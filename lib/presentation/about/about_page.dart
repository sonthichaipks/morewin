import 'package:flick_video_player/flick_video_player.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:morewin/presentation/about/about_controller.dart';
import 'package:morewin/presentation/widgets/common/web_video_control.dart';
import 'package:video_player/video_player.dart';

import '../information/information_controller.dart';
import '../information/information_page.dart';
import '../myyoutube/youmain.dart';
import 'package:qr_bar_code/code/code.dart';
import 'package:qr_bar_code/qr/qr.dart';

import '../widgets/common/typewriter.dart';

class AboutPage extends GetResponsiveView<AboutController> {
  // var fCTRL = Get.find(AboutController();
  // final InformationController fCTRL = Get.find();
  AboutPage()
      : super(
            settings: ResponsiveScreenSettings(
                desktopChangePoint: 1000,
                tabletChangePoint: 768,
                watchChangePoint: 300));

  @override
  Widget desktop() {
    return Scaffold(
      body: Obx(() => Container(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                GridView.builder(
                    controller: controller.scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemCount: controller.images.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          infoPop('ืคลิก', '${index.toString()}');
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              controller.images.value[index].urls?.small ?? "",
                          fit: BoxFit.cover,
                          imageRenderMethodForWeb:
                              ImageRenderMethodForWeb.HtmlImage,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => BlurHash(
                                  hash: controller.images.value[index].color ??
                                      ""),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      );
                    }),
                Align(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: SizedBox(
                      height: Get.width / 9, // * .5625,
                      width: Get.width / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // QRCode(data: "http://202.44.229.165"),
                              Code(
                                  data: "http://202.44.229.165",
                                  codeType: CodeType.qrCode()),
                              Typewriter(
                                'Super store to anyone who is member',
                                animate: !controller.positionSeen.value,
                                textStyle: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                onEnd: () {
                                  controller.showAbstract.value = true;
                                  controller.positionSeen.value = true;
                                  controller.update();
                                },
                              ),
                            ],
                          ),
                        ),
                        // ),

                        // InformationPage(),

                        // YoutubePlayerApp(),

                        //  FlickVideoPlayer(
                        //   flickManager: controller.flickManager,
                        //   flickVideoWithControls: FlickVideoWithControls(
                        //     controls: WebVideoControl(
                        //       dataManager: controller.dataManager!,
                        //       iconSize: 30,
                        //       fontSize: 14,
                        //       progressBarSettings: FlickProgressBarSettings(
                        //         height: 5,
                        //         handleRadius: 5.5,
                        //       ),
                        //     ),
                        //     videoFit: BoxFit.contain,
                        //     // aspectRatioWhenLoading: 4 / 3,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  void infoPop(String title, String msg) {
    Get.defaultDialog(
      title: title,
      titleStyle: const TextStyle(color: Colors.red),
      middleText: msg,
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      body: Obx(() => Container(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                GridView.builder(
                    controller: controller.scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 64,
                        childAspectRatio: 1,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemCount: controller.images.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return CachedNetworkImage(
                        imageUrl:
                            controller.images.value[index].urls?.small ?? "",
                        fit: BoxFit.cover,
                        imageRenderMethodForWeb:
                            ImageRenderMethodForWeb.HtmlImage,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => BlurHash(
                                hash: controller.images.value[index].blurHash ??
                                    ""),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    }),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(32, 32, 32, 32),
                    child: Center(
                      child: SizedBox(
                        // height: Get.width / 3, // * .5625,
                        // width: Get.width / 3,
                        // height: Get.width * 0.5625,
                        // width: Get.width,
                        child: Container(
                          height: Get.width / 3, // * .5625,
                          width: Get.width / 3,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // QRCode(data: "http://202.44.229.165"),
                                  Code(
                                      data: "http://202.44.229.165",
                                      codeType: CodeType.qrCode()),
                                  // Text(
                                  //   'Super store\nwho is member',
                                  // ),
                                  Typewriter(
                                    'Super store to anyone who is member',
                                    animate: !controller.positionSeen.value,
                                    textStyle: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    onEnd: () {
                                      controller.showAbstract.value = true;
                                      controller.positionSeen.value = true;
                                      controller.update();
                                    },
                                  ),
                                ],
                              ),
                            ),

                            // YoutubePlayerApp(),
                            //  FlickVideoPlayer(
                            //   flickManager: controller.flickManager,
                            //   flickVideoWithControls: FlickVideoWithControls(
                            //     controls: WebVideoControl(
                            //       dataManager: controller.dataManager!,
                            //       iconSize: 30,
                            //       fontSize: 14,
                            //       progressBarSettings: FlickProgressBarSettings(
                            //         height: 5,
                            //         handleRadius: 5.5,
                            //       ),
                            //     ),
                            //     videoFit: BoxFit.contain,
                            //     // aspectRatioWhenLoading: 4 / 3,
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
