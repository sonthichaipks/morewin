import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/constants/theme_provider.dart';
import '../widgets/common/home_background_painter.dart';
import '../widgets/common/nav_bar.dart';
import 'projects_controller.dart';

class ProjectsPage extends GetView<ProjectsController> {
  ProjectsPage();

  @override
  Widget build(BuildContext context) {
    // final isDesktop = Responsive.isDesktop(context);

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: mng_theme.secondaryColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GetBuilder<ProjectsController>(
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


// class ProjectsPage extends GetResponsiveView<ProjectsController> {
//   ProjectsPage() : super(settings: ResponsiveScreenSettings(desktopChangePoint: 1000, tabletChangePoint: 768, watchChangePoint: 300));

//   @override
  Widget _restbody(ProjectsController controller) {
    return  Obx(() => Container(
      child: Stack(
        children: [
          AnimatedSwitcher(duration: Duration(seconds: 3),child: controller.portfolios[controller.selectedIndex.value].desktop(),),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              margin: EdgeInsets.all(32),
              child: ListView.builder(
                itemBuilder: (context,i){
                  return InkWell(
                    onTap: (){
                      controller.selectedIndex.value = i;
                      controller.update();
                      controller.selectedIndex.refresh();
                    },
                    child: Container(
                      width:  42,
                      height: 42,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color:Colors.black.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: controller.selectedIndex.value==i?Colors.orange:Colors.transparent,width: 2)
                      ),
                      child: Center(child: Text((i+1).toString(),style: TextStyle(
                        color: controller.selectedIndex.value==i?Colors.orange:Colors.white,
                        fontSize: controller.selectedIndex.value==i?14:12,
                        fontWeight: controller.selectedIndex.value==i?FontWeight.w600:FontWeight.normal
                      ),)),
                    ),
                  );
                },
                itemCount: controller.portfolios.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,),
            ),
          )
        ],
      ),
    ));
  }

  // @override
  // Widget phone() {
  //   return  Obx(() => Stack(
  //     children: [
  //       AnimatedSwitcher(duration: Duration(seconds: 3),child: controller.portfolios[controller.selectedIndex.value].phone(),),
  //       Align(
  //         alignment: Alignment.centerRight,
  //         child: Container(
  //           width: 44,
  //           margin: EdgeInsets.all(32),
  //           child: ListView.builder(
  //             itemBuilder: (context,i){
  //               return InkWell(
  //                 onTap: (){
  //                   controller.selectedIndex.value = i;
  //                   controller.update();
  //                   controller.selectedIndex.refresh();
  //                 },
  //                 child: Container(
  //                   width:  36,
  //                   height: 36,
  //                   margin: EdgeInsets.all(4),
  //                   decoration: BoxDecoration(
  //                       color:Colors.black.withOpacity(0.65),
  //                       borderRadius: BorderRadius.circular(100),
  //                       border: Border.all(color: controller.selectedIndex.value==i?Colors.orange:Colors.transparent,width: 2)
  //                   ),
  //                   child: Center(child: Text((i+1).toString(),style: TextStyle(
  //                       color: controller.selectedIndex.value==i?Colors.orange:Colors.white,
  //                       fontSize: controller.selectedIndex.value==i?12:10,
  //                       fontWeight: controller.selectedIndex.value==i?FontWeight.w600:FontWeight.normal
  //                   ),)),
  //                 ),
  //               );
  //             },
  //             itemCount: controller.portfolios.length,
  //             scrollDirection: Axis.vertical,
  //             shrinkWrap: true,),
  //         ),
  //       )
  //     ],
  //   ));

  // }
}
