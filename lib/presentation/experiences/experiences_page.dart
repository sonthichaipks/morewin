import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/presentation/widgets/mobile/experience_background_painter_for_mobile.dart';

import '../../app/constants/theme_provider.dart';
import '../widgets/common/experience_background_painter.dart';
import '../widgets/common/experience_time_line_widget.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import 'experiences_controller.dart';

class ExperiencesPage extends GetView<ExperiencesController> {
  ExperiencesPage();

  @override
  Widget build(BuildContext context) {
    // final isDesktop = Responsive.isDesktop(context);

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mng_theme.secondaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GetBuilder<ExperiencesController>(
              // initState: controller.init(context),
              init: controller,
              builder: (context) {
                return Scaffold(
                  body: Stack(
                    children: [
                      CustomPaint(
                          painter: HomeBackgroundPainter(Colors.lightBlue),
                          size: Size.infinite),
                      Container(
                        // width: Get.width,
                        // height: Get.height,
                        child: _restbody(
                            controller), //controller.pages[controller.selectedIndex.value],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Navbar(),
                      ),
                    ],
                  ),
                );
              })),
    );
  }

// class ExperiencesPage extends GetResponsiveView<ExperiencesController> {
//   ExperiencesPage()
//       : super(
//             settings: ResponsiveScreenSettings(
//                 desktopChangePoint: 1000,
//                 tabletChangePoint: 768,
//                 watchChangePoint: 300));

//   @override
  Widget _restbody(ExperiencesController controller) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 48),
                child: Image(
                  image: AssetImage("assets/images/programmer.gif"),
                  height: Get.height / 4,
                  width: Get.height / 3,
                ),
              ),
            ),
            CustomPaint(
                painter: ExperienceBackgroundPainter(Colors.white),
                size: Size.infinite),
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 128),
                  child: ExprienceTimeLineWidget(controller.experiences.value),
                )),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget phone() {
  //   return Scaffold(
  //     body: Container(
  //       color: Colors.white,
  //       width: Get.width,
  //       height: Get.height,
  //       child: Stack(
  //         children: [
  //           Align(
  //             alignment: Alignment.bottomRight,
  //             child: Container(
  //               margin: EdgeInsets.only(bottom: 48),
  //               child: Image(
  //                 image: AssetImage("assets/images/programmer.gif"),
  //                 height: Get.height / 4,
  //                 width: Get.height / 3,
  //               ),
  //             ),
  //           ),
  //           CustomPaint(
  //               painter: ExperienceBackgroundPainterForMobile(Colors.white),
  //               size: Size.infinite),
  //           Align(
  //               alignment: Alignment.center,
  //               child: Container(
  //                 margin: const EdgeInsets.only(bottom: 128),
  //                 child: ExprienceTimeLineWidget(controller.experiences.value),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
