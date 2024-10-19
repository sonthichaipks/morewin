import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:com.morepos.morewin/presentation/blog/blog_controller.dart';
import 'package:com.morepos.morewin/presentation/widgets/common/loading_widget.dart';
import 'package:com.morepos.morewin/presentation/widgets/common/no_post_widget.dart';

import '../../app/constants/theme_provider.dart';
import '../widgets/common/blog_background_painter.dart';
import '../widgets/common/blog_post_item.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import '../widgets/mobile/blog_background_painter_for_mobile.dart';

class BlogPage extends GetView<BlogController> {
  BlogPage();

  @override
  Widget build(BuildContext context) {
    // final isDesktop = Responsive.isDesktop(context);

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mng_theme.secondaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GetBuilder<BlogController>(
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

// class BlogPage extends GetResponsiveView<BlogController> {
//   BlogPage()
//       : super(
//             settings: ResponsiveScreenSettings(
//                 desktopChangePoint: 1000,
//                 tabletChangePoint: 768,
//                 watchChangePoint: 300));

//   @override
  Widget _restbody(BlogController controller) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Obx(() => Stack(
              children: [
                CustomPaint(
                    painter: BlogBackgroundPainter(), size: Size.infinite),
                controller.mediumPostsResponse?.value == null
                    ? LoadingWidget()
                    : controller.mediumPostsResponse!.value!.items!.isEmpty
                        ? NoPostWidget()
                        : Container(
                            padding: EdgeInsets.fromLTRB(96, 96, 96, 32),
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 8.0,
                                        mainAxisSpacing: 8.0,
                                        childAspectRatio:
                                            ((Get.width - 192) / 3) / 330),
                                itemCount: controller
                                    .mediumPostsResponse!.value!.items!.length,
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext ctx, index) {
                                  return BlogPostItem(controller
                                      .mediumPostsResponse!
                                      .value!
                                      .items![index]);
                                }),
                          ),
              ],
            )),
      ),
    );
  }

  // @override
  // Widget phone() {
  //   return Scaffold(
  //     body: Obx(() => Stack(
  //           children: [
  //             controller.mediumPostsResponse?.value == null
  //                 ? LoadingWidget()
  //                 : controller.mediumPostsResponse!.value!.items!.isEmpty
  //                     ? NoPostWidget()
  //                     : Container(
  //                         padding: EdgeInsets.fromLTRB(16, 96, 16, 16),
  //                         child: GridView.builder(
  //                             gridDelegate:
  //                                 SliverGridDelegateWithFixedCrossAxisCount(
  //                                     crossAxisCount: 2,
  //                                     crossAxisSpacing: 8.0,
  //                                     mainAxisSpacing: 8.0,
  //                                     childAspectRatio:
  //                                         ((Get.width - 32) / 2) / 330),
  //                             itemCount: controller
  //                                 .mediumPostsResponse!.value!.items!.length,
  //                             physics: AlwaysScrollableScrollPhysics(),
  //                             itemBuilder: (BuildContext ctx, index) {
  //                               return BlogPostItem(controller
  //                                   .mediumPostsResponse!.value!.items![index]);
  //                             }),
  //                       ),
  //             CustomPaint(
  //                 painter: ExperienceBackgroundPainterForMobile(),
  //                 size: Size.infinite),
  //           ],
  //         )),
  //   );
  // }
}
