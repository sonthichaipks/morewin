import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/app/util/url_helper.dart';
import 'package:com.morepos.morewin/presentation/widgets/common/rounded_button.dart';
import '../widgets/common/hero_images.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/mobile/home_background_painter_for_mobile.dart';
import '../widgets/mobile/social_media_bar_for_mobile.dart';
import 'information_controller.dart';
import '../widgets/common/social_media_bar.dart';
import '../widgets/common/typewriter.dart';

class InformationPage extends GetResponsiveView<InformationController> {
  InformationPage()
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
            child: 
            Stack(
              children: [
                CustomPaint(
                    painter: HomeBackgroundPainter(Colors.lightBlue),
                    size: Size.infinite),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            Get.width * 0.1, 0, Get.width * 0.1, 0),
                        child: AnimatedSize(
                          // vsync: controller,
                          duration: kThemeAnimationDuration,
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                           
                              Typewriter(
                                'Welcome to',
                                animate: !controller.helloSeen.value,
                                textStyle: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.4,
                                ),
                                onEnd: () {
                                  controller.showName.value = true;
                                  controller.helloSeen.value = true;
                                  controller.update();
                                },
                              ),
                              if (controller.showName.value) ...[
                                SizedBox(height: 16),
                                Typewriter(
                                  'Morepos Store',
                                  animate: !controller.nameSeen.value,
                                  textStyle: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  onEnd: () {
                                    controller.showPosition.value = true;
                                    controller.nameSeen.value = true;

                                    controller.update();
                                  },
                                ),
                              ],
                              if (controller.showPosition.value) ...[
                                SizedBox(height: 16),
                                Typewriter(
                                  'Super store to anyone who is member',
                                  animate: !controller.positionSeen.value,
                                  textStyle: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onEnd: () {
                                    controller.showAbstract.value = true;
                                    controller.positionSeen.value = true;
                                    controller.update();
                                  },
                                ),
                              ],
                              if (controller.showAbstract.value) ...[
                                SizedBox(height: 24),
                                Typewriter(
                                  "เราได้รวมเครื่องมือซื้อขาย ไว้ในระบบเดียวกันให้ภาคส่วนใช้งานอย่างสะดวกง่ายดาย\n"
                                  'เพียงท่านล๊อกอินเข้าสู่ระบบด้วยบัญชีแบบใด ท่านจะได้การทำงานตามบัญชีนั้นทันที.\n'
                                  'โดยแบ่งเป็นเป็นผู้จำหน่ายส่ง ร้านค้า หรือ สมาชิกร้านค้า.',
                                  animate: !controller.abstractSeen.value,
                                  textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    letterSpacing: 1.2,
                                    height: 1.3,
                                  ),
                                  onEnd: () {
                                    Future.delayed(Duration(milliseconds: 500),
                                        () {
                                      controller.showHireMe.value = true;
                                      controller.abstractSeen.value = true;
                                      controller.update();
                                    });
                                  },
                                ),
                              ],
                              if (controller.showHireMe.value) ...[
                                SizedBox(height: 30),
                                SizedBox(
                                  width: 160,
                                  child: RoundedButton(
                                      "Send Me Email",
                                      Colors.orange,
                                      Colors.orange,
                                      Colors.white, () {
                                    UrlHelper.launchUrl(
                                        "mailto:pks.sonthichai@gmail.com");
                                  }),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              Get.width * 0.1, 0, Get.width * 0.1, 0),
                          child: Center(child: HeroImage())),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomCenter, child: SocialMediaBar()),
              ],
            ),
          )),
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
                CustomPaint(
                    painter: HomeBackgroundPainterForMobile(Colors.lightBlue),
                    size: Size.infinite),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        flex: 4,
                        child: HeroImage(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: AnimatedSize(
                              // vsync: controller,
                              duration: kThemeAnimationDuration,
                              alignment: Alignment.topCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Typewriter(
                                    'Welcome to',
                                    animate: !controller.helloSeen.value,
                                    textStyle: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.4,
                                    ),
                                    onEnd: () {
                                      controller.showName.value = true;
                                      controller.helloSeen.value = true;
                                      controller.update();
                                    },
                                  ),
                                  if (controller.showName.value) ...[
                                    SizedBox(height: 16),
                                    Typewriter(
                                      'Morepos Store',
                                      animate: !controller.nameSeen.value,
                                      textStyle: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      onEnd: () {
                                        controller.showPosition.value = true;
                                        controller.nameSeen.value = true;

                                        controller.update();
                                      },
                                    ),
                                  ],
                                  if (controller.showPosition.value) ...[
                                    SizedBox(height: 16),
                                    Typewriter(
                                      'Super store to anyone who is member',
                                      animate: !controller.positionSeen.value,
                                      textStyle: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      onEnd: () {
                                        controller.showAbstract.value = true;
                                        controller.positionSeen.value = true;
                                        controller.update();
                                      },
                                    ),
                                  ],
                                  if (controller.showAbstract.value) ...[
                                    SizedBox(height: 24),
                                    Typewriter(
                                      "เราได้รวมเครื่องมือซื้อขาย ไว้ในระบบเดียวกันให้ภาคส่วนใช้งานอย่างสะดวกง่ายดาย\n"
                                      'เพียงท่านล๊อกอินเข้าสู่ระบบด้วยบัญชีแบบใด ท่านจะได้การทำงานตามบัญชีนั้นทันที.\n'
                                      'โดยแบ่งเป็นเป็นผู้จำหน่ายส่ง ร้านค้า หรือ สมาชิกร้านค้า.',
                                      animate: !controller.abstractSeen.value,
                                      textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        letterSpacing: 1.2,
                                        height: 1.3,
                                      ),
                                      onEnd: () {
                                        Future.delayed(
                                            Duration(milliseconds: 500), () {
                                          controller.showHireMe.value = true;
                                          controller.abstractSeen.value = true;
                                          controller.update();
                                        });
                                      },
                                    ),
                                  ],
                                  if (controller.showHireMe.value) ...[
                                    SizedBox(height: 30),
                                    SizedBox(
                                      width: 160,
                                      child: RoundedButton(
                                          "Send Me Email",
                                          Colors.orange,
                                          Colors.orange,
                                          Colors.white, () {
                                        UrlHelper.launchUrl(
                                            "mailto:pks.sonthichai@gmail.com");
                                      }),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SocialMediaBarForMobile()),
              ],
            ),
          )),
    );
  }
}
